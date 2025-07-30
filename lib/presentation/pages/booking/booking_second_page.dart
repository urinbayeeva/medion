import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/custom_button.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/phone_number_component.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/pages/booking/phone_callback_dialog.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingSecondPage extends StatefulWidget {
  final bool isUSD;
  final int serviceId;
  final bool show;

  const BookingSecondPage({
    super.key,
    required this.isUSD,
    required this.serviceId,
    required this.show,
  });

  @override
  State<BookingSecondPage> createState() => _BookingSecondPageState();
}

class _BookingSecondPageState extends State<BookingSecondPage> {
  late final SelectedServiceIdsProvider _serviceIdsProvider;
  late final SelectedServicesProvider _servicesProvider;
  int chose = 0;
  int? selectedIndex;
  List<Service> selectedServices = [];
  final List<int> selectedServiceIDCatch = [];
  double turns = 0.0;
  bool changeSum = false;
  late DBService dbService;
  late FocusNode focusNode;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _phoneNumberController;
  late TextEditingController _searchController;
  List<Category> _filteredCategories = [];
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController(text: "+998 ");
    _searchController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    focusNode = FocusNode();
    _initializeDBService();
    _serviceIdsProvider = Provider.of<SelectedServiceIdsProvider>(context, listen: false);
    _servicesProvider = Provider.of<SelectedServicesProvider>(context, listen: false);
    // Clear services for the current serviceId
    _servicesProvider.clearServices(widget.serviceId);
    _serviceIdsProvider.clearServiceIds(widget.serviceId);
    _serviceIdsProvider.addListener(_updateSelectedServices);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookingBloc>().add(
            BookingEvent.fetchCategoryServices(id: widget.serviceId),
          );
    });

    _updateSelectedServices();
  }

  @override
  void dispose() {
    _serviceIdsProvider.removeListener(_updateSelectedServices);
    _phoneNumberController.dispose();
    _searchController.dispose();
    focusNode.dispose();
    _searchDebounce?.cancel();
    // Clear services for the current serviceId
    _servicesProvider.clearServices(widget.serviceId);
    _serviceIdsProvider.clearServiceIds(widget.serviceId);
    super.dispose();
  }

  Future<void> _initializeDBService() async {
    dbService = await DBService.create;
    setState(() {
      changeSum = dbService.getCurrencyPreference;
    });
  }

  void _updateSelectedServices() {
    if (!mounted) return;
    final bookingState = context.read<BookingBloc>().state;
    final selectedIds = _serviceIdsProvider.getSelectedServiceIds(widget.serviceId);

    setState(() {
      selectedServices = bookingState.categoryServices
          .expand((category) => category.services)
          .where((service) => selectedIds.contains(service.id))
          .toList();

      chose = selectedServices.length;
      selectedServiceIDCatch
        ..clear()
        ..addAll(selectedIds);

      if (_searchController.text.isEmpty) {
        _filteredCategories = bookingState.categoryServices.toList();
      }

      // Warn if there are selected services from a different serviceId
    });
  }

  void _filterServices(String query) {
    if (!mounted) return;

    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;

      final bookingState = context.read<BookingBloc>().state;
      if (bookingState.categoryServices.isEmpty) return;

      if (query.isEmpty) {
        setState(() {
          _filteredCategories = List<Category>.from(bookingState.categoryServices);
        });
        return;
      }

      final lowercaseQuery = query.toLowerCase();
      try {
        final filtered = bookingState.categoryServices.where((category) {
          final categoryName = category.name?.toString().toLowerCase() ?? '';
          return categoryName.contains(lowercaseQuery) ||
              category.services.any((service) {
                final serviceName = service.name?.toLowerCase() ?? '';
                final serviceDescription = service.decodedDescription.toLowerCase();
                return serviceName.contains(lowercaseQuery) || serviceDescription.contains(lowercaseQuery);
              });
        }).map((category) {
          return Category((b) => b
            ..name = category.name
            ..services.replace(category.services.where((service) {
              final serviceName = service.name?.toLowerCase() ?? '';
              final serviceDescription = service.decodedDescription.toLowerCase();
              return serviceName.contains(lowercaseQuery) || serviceDescription.contains(lowercaseQuery);
            }).toList()));
        }).toList();

        if (mounted) {
          setState(() {
            _filteredCategories = filtered;
          });
        }
      } catch (e) {
        debugPrint('Error filtering services: $e');
      }
    });
  }

  void _showPhoneCallbackDialog(BuildContext context, colors, fonts, List<int> serviceIds) async {
    bool? confirmCallBack = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colors.shade0,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Обратный звонок".tr(),
                style: fonts.mediumMain,
              ),
            ),
            12.h.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              "Оставьте свой номер телефона и мы вам перезвоним".tr(),
              style: fonts.xSmallMain.copyWith(fontSize: 14.sp),
            ),
            12.h.verticalSpace,
            Text("contact_phone_number".tr(), style: fonts.regularLink),
            CustomTextField(
              autoFocus: true,
              title: "",
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (value.length >= 17) {
                  setState(() {});
                }
              },
              controller: _phoneNumberController,
              formatter: <TextInputFormatter>[InternationalPhoneFormatter()],
              hintText: '+998',
              validator: (String? text) {},
            ),
            30.h.verticalSpace,
            CButton(
              title: "send".tr(),
              onTap: () async {
                final phone = _phoneNumberController.text;

                final response = await http.post(
                  Uri.parse('${Constants.baseUrlP}/help/call'),
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: jsonEncode({
                    'phone': phone,
                    'service_ids': serviceIds,
                  }),
                );
                debugPrint("Status Code: ${response.statusCode}");
                Navigator.of(context).pop();

                if (response.statusCode == 200) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: colors.shade0,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/done.svg"),
                            8.h.verticalSpace,
                            Text("Заявка оставлена", style: fonts.mediumMain),
                            4.h.verticalSpace,
                            Text(
                              textAlign: TextAlign.center,
                              "В скором времени мы вам перезвоним по поводу вашей заявки",
                              style: fonts.xSmallMain,
                            ),
                            30.h.verticalSpace,
                            CButton(
                              title: "back".tr(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(index: 0),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Ошибка отправки данных")),
                  );
                }
              },
            ),
          ],
        ),
        actions: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        final RefreshController refreshController = RefreshController();

        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "choose_service".tr(),
                isBack: true,
                showBottomBar: true,
                centerTitle: true,
                trailing: Row(
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: const Duration(seconds: 1),
                      child: AnimationButtonEffect(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: colors.shade0,
                                title: Center(
                                    child: Text(
                                  "information".tr(),
                                  style: fonts.regularMain.copyWith(color: colors.error500),
                                )),
                                content: Text(
                                  "info_desc".tr(),
                                  style: fonts.regularLink,
                                ),
                                actions: [
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
                                    ),
                                    child: Text("cancel".tr()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Colors.red),
                                      overlayColor: MaterialStateProperty.all(Colors.red.withOpacity(0.1)),
                                    ),
                                    child: Text("confirm".tr()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        turns += 2 / 4;
                                        changeSum = !changeSum;
                                        dbService.setCurrencyPreference(changeSum);
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: icons.valyutaChange.svg(width: 20.w, height: 20.h),
                      ),
                    ),
                  ],
                ),
                bottom: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'step'.tr(namedArgs: {"count": "2", "total": "5"}),
                            style: fonts.xSmallLink
                                .copyWith(color: colors.neutral600, fontSize: 13.sp, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: "  ${"selecting_service_type".tr()}",
                            style: fonts.xSmallLink
                                .copyWith(color: colors.primary900, fontSize: 13.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    CustomProgressBar(count: 2, allCount: 5),
                    2.h.verticalSpace,
                    CustomTextField(
                      controller: _searchController,
                      hintText: "search_by_services".tr(),
                      prefixIcon: icons.search.svg(color: colors.neutral500),
                      onChanged: _filterServices,
                    ),
                    4.h.verticalSpace,
                  ],
                ),
              ),
              BlocConsumer<BookingBloc, BookingState>(
                listener: (context, state) {
                  if (state.categoryServices.isNotEmpty && mounted) {
                    setState(() {
                      if (_searchController.text.isEmpty) {
                        _filteredCategories = state.categoryServices.toList();
                      }
                    });
                  }
                },
                builder: (context, state) {
                  if (state.loading) {
                    return Expanded(
                      child: ShimmerView(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ShimmerContainer(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              height: 70.h,
                              borderRadius: 12.r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: ShimmerContainer(
                                      width: 150.w,
                                      height: 16.h,
                                      borderRadius: 4.r,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: 2,
                                      itemBuilder: (context, serviceIndex) {
                                        return ShimmerContainer(
                                          height: 80.h,
                                          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                          borderRadius: 8.r,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ShimmerContainer(
                                                        width: 120.w,
                                                        height: 14.h,
                                                        borderRadius: 4.r,
                                                      ),
                                                      8.h.verticalSpace,
                                                      ShimmerContainer(
                                                        width: 80.w,
                                                        height: 12.h,
                                                        borderRadius: 4.r,
                                                      ),
                                                      8.h.verticalSpace,
                                                      ShimmerContainer(
                                                        width: 100.w,
                                                        height: 12.h,
                                                        borderRadius: 4.r,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ShimmerContainer(
                                                width: 40.w,
                                                height: 40.h,
                                                borderRadius: 8.r,
                                                margin: EdgeInsets.all(8.w),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }

                  if (state.error || state.categoryServices.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 48, color: colors.neutral400),
                            16.h.verticalSpace,
                            Text(
                              _searchController.text.isEmpty ? "no_services_available".tr() : "no_search_results".tr(),
                              style: Style.headlineMain().copyWith(color: colors.neutral500),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final categoriesToDisplay =
                      _searchController.text.isNotEmpty ? _filteredCategories : state.categoryServices;

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomListView(
                        onRefresh: () async {
                          if (!mounted) return;
                          final selectedId = context.read<BookingBloc>().state.selectedServiceId;
                          context.read<BookingBloc>().add(
                                BookingEvent.fetchCategoryServices(id: selectedId!),
                              );
                          refreshController.refreshCompleted();
                        },
                        refreshController: refreshController,
                        padding: EdgeInsets.only(top: 16.w),
                        itemBuilder: (index, category) {
                          var item = categoriesToDisplay[index];

                          return CustomExpansionListTile(
                            title: item.name is bool ? "" : item.name.toString(),
                            description: item.services.isEmpty ? 'no_services_available'.tr() : 'services_list'.tr(),
                            children: item.services.map((service) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 1, color: Color(0xFFF2F2F3)),
                                    bottom: BorderSide(width: 1, color: Color(0xFFF2F2F3)),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 12.h),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  service.name!,
                                                  style: fonts.smallSemLink.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                service.decodedDescription.isEmpty
                                                    ? SizedBox.shrink()
                                                    : Text(
                                                        service.decodedDescription,
                                                        style: fonts.smallLink.copyWith(
                                                          color: colors.neutral600,
                                                          fontSize: 11.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        softWrap: true,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                18.h.verticalSpace,
                                                Text(
                                                  (widget.isUSD || changeSum)
                                                      ? "${formatNumber(service.priceUsd, isDecimal: true)} USD"
                                                      : "sum".tr(namedArgs: {
                                                          "amount": formatNumber(service.priceUzs, isDecimal: true)
                                                        }),
                                                  style: fonts.smallLink.copyWith(
                                                    color: colors.primary900,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                                Text(
                                                  "with_vat".tr(),
                                                  style: fonts.smallLink.copyWith(
                                                    fontSize: 13.sp,
                                                    color: colors.neutral600,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  softWrap: true,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          AnimationButtonEffect(
                                            onTap: () {
                                              if (service.canReceiveCallBack == true) {
                                                _showPhoneCallbackDialog(context, colors, fonts, [service.id!]);
                                              } else {
                                                setState(() {
                                                  if (_servicesProvider
                                                      .getSelectedServices(widget.serviceId)
                                                      .contains(service)) {
                                                    _servicesProvider.removeService(widget.serviceId, service);
                                                    _serviceIdsProvider.removeServiceId(widget.serviceId, service.id!);
                                                  } else {
                                                    _servicesProvider.addService(widget.serviceId, service);
                                                    _serviceIdsProvider.addServiceId(widget.serviceId, service.id!);
                                                  }
                                                  selectedServiceIDCatch
                                                    ..clear()
                                                    ..addAll(
                                                        _serviceIdsProvider.getSelectedServiceIds(widget.serviceId));
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(12.w),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.r),
                                                color: _servicesProvider
                                                        .getSelectedServices(widget.serviceId)
                                                        .contains(service)
                                                    ? colors.error500
                                                    : colors.neutral200,
                                              ),
                                              child: service.canReceiveCallBack == true
                                                  ? icons.phone.svg(
                                                      color: _servicesProvider
                                                              .getSelectedServices(widget.serviceId)
                                                              .contains(service)
                                                          ? colors.shade0
                                                          : colors.primary900)
                                                  : _servicesProvider
                                                          .getSelectedServices(widget.serviceId)
                                                          .contains(service)
                                                      ? icons.check.svg(color: colors.shade0)
                                                      : icons.plus.svg(color: colors.primary900),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        },
                        data: categoriesToDisplay,
                        emptyWidgetModel: ErrorWidgetModel(title: "", subtitle: ""),
                        status: FormzSubmissionStatus.success,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  if (state.categoryServices.isEmpty && !state.loading) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: colors.neutral200),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "count_services_selected".tr(namedArgs: {"count": "$chose"}),
                              style: fonts.xSmallLink.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AnimationButtonEffect(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  enableDrag: true,
                                  constraints: BoxConstraints(
                                    maxHeight: MediaQuery.of(context).size.height * 0.8,
                                  ),
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setModalState) {
                                        return ListenableProvider.value(
                                          value: _servicesProvider,
                                          child: Consumer<SelectedServicesProvider>(
                                            builder: (context, provider, child) {
                                              return ConstrainedBox(
                                                constraints: const BoxConstraints(),
                                                child: SingleChildScrollView(
                                                  child: ServiceSelectionModal(
                                                    selectedServices: provider.getSelectedServices(widget.serviceId),
                                                    chose: provider.getSelectedServices(widget.serviceId).length,
                                                    onRemoveService: (service) {
                                                      if (!mounted) return;
                                                      _servicesProvider.removeService(widget.serviceId, service);
                                                      _serviceIdsProvider.removeServiceId(
                                                          widget.serviceId, service.id!);
                                                    },
                                                    onRemoveAllServices: () {
                                                      if (!mounted) return;
                                                      _servicesProvider.clearServices(widget.serviceId);
                                                      _serviceIdsProvider.clearServiceIds(widget.serviceId);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: icons.right.svg(
                                width: 20.w,
                                height: 20.h,
                                color: colors.iconGreyColor,
                              ),
                            ),
                          ],
                        ),
                        12.h.verticalSpace,
                        CustomButton(
                          borderRadius: 8.r,
                          title: "continue".tr(),
                          isDisabled: chose == 0,
                          onPressed: () async {
                            final selectedServices = state.categoryServices
                                .expand((category) => category.services)
                                .where((service) => selectedServiceIDCatch.contains(service.id))
                                .toList();

                            final requiresCallBack =
                                selectedServices.any((service) => service.canReceiveCallBack == true);

                            if (requiresCallBack) {
                              await showDialog(
                                context: context,
                                builder: (context) => PhoneCallbackDialog(
                                  serviceIds: selectedServiceIDCatch.toList(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedServiceDoctorChose(
                                    isHome: true,
                                    servicesID: _serviceIdsProvider.getSelectedServiceIds(widget.serviceId),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
