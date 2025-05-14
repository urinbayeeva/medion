import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/phone_number_component.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingSecondPage extends StatefulWidget {
  final bool isUSD;
  final int serviceId;

  const BookingSecondPage({
    super.key,
    required this.isUSD,
    required this.serviceId,
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
    _serviceIdsProvider =
        Provider.of<SelectedServiceIdsProvider>(context, listen: false);
    _servicesProvider =
        Provider.of<SelectedServicesProvider>(context, listen: false);
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
    setState(() {
      selectedServices = bookingState.categoryServices
          .expand((category) => category.services)
          .where((service) =>
              _serviceIdsProvider.selectedServiceIds.contains(service.id))
          .toList();
      chose = selectedServices.length - 1;
      selectedServiceIDCatch.clear();
      selectedServiceIDCatch.addAll(_serviceIdsProvider.selectedServiceIds);
      if (_searchController.text.isEmpty) {
        _filteredCategories = bookingState.categoryServices.toList();
      }
    });
  }

  void _filterServices(String query) {
    if (!mounted) return;

    // Cancel any previous debounce timer
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();

    // Set up new debounce timer
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;

      final bookingState = context.read<BookingBloc>().state;
      if (bookingState.categoryServices.isEmpty) return;

      if (query.isEmpty) {
        setState(() {
          _filteredCategories =
              List<Category>.from(bookingState.categoryServices);
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
                final serviceDescription =
                    service.decodedDescription.toLowerCase();
                return serviceName.contains(lowercaseQuery) ||
                    serviceDescription.contains(lowercaseQuery);
              });
        }).map((category) {
          return Category((b) => b
            ..name = category.name
            ..services.replace(category.services.where((service) {
              final serviceName = service.name?.toLowerCase() ?? '';
              final serviceDescription =
                  service.decodedDescription.toLowerCase();
              return serviceName.contains(lowercaseQuery) ||
                  serviceDescription.contains(lowercaseQuery);
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

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        // Create a new RefreshController for this build
        final RefreshController refreshController = RefreshController();

        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "choose_service".tr(),
                isBack: true,
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
                                  style: fonts.regularMain
                                      .copyWith(color: colors.error500),
                                )),
                                content: Text(
                                  "info_desc".tr(),
                                  style: fonts.regularLink,
                                ),
                                actions: [
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.black.withOpacity(0.1)),
                                    ),
                                    child: Text("cancel".tr()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.red.withOpacity(0.1)),
                                    ),
                                    child: Text("confirm".tr()),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        turns += 2 / 4;
                                        changeSum = !changeSum;
                                        dbService
                                            .setCurrencyPreference(changeSum);
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child:
                            icons.valyutaChange.svg(width: 20.w, height: 20.h),
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
                            text: 'step'
                                .tr(namedArgs: {"count": "2", "total": "5"}),
                            style: fonts.xSmallLink.copyWith(
                                color: colors.neutral600,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: "  ${"selecting_service_type".tr()}",
                            style: fonts.xSmallLink.copyWith(
                                color: colors.primary900,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const CustomProgressBar(
                      count: 1,
                      allCount: 5,
                    ),
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
                  if (state.categoryServices.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  final categoriesToDisplay = _searchController.text.isNotEmpty
                      ? _filteredCategories
                      : state.categoryServices;

                  if (categoriesToDisplay.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off,
                                size: 48, color: colors.neutral400),
                            16.h.verticalSpace,
                            Text(
                              _searchController.text.isEmpty
                                  ? "no_services_available".tr()
                                  : "no_search_results".tr(),
                              style: Style.headlineMain()
                                  .copyWith(color: colors.neutral500),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomListView(
                        onRefresh: () async {
                          if (!mounted) return;
                          final selectedId = context
                              .read<BookingBloc>()
                              .state
                              .selectedServiceId;
                          context.read<BookingBloc>().add(
                                BookingEvent.fetchCategoryServices(
                                    id: selectedId!),
                              );
                          refreshController.refreshCompleted();
                        },
                        refreshController: refreshController,
                        padding: EdgeInsets.only(top: 16.w),
                        itemBuilder: (index, category) {
                          var item = categoriesToDisplay[index];

                          return CustomExpansionListTile(
                            title:
                                item.name is bool ? "" : item.name.toString(),
                            description: item.services.isEmpty
                                ? 'no_services_available'.tr()
                                : 'services_list'.tr(),
                            children: item.services.map((service) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 1, color: Color(0xFFF2F2F3)),
                                    bottom: BorderSide(
                                        width: 1, color: Color(0xFFF2F2F3)),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  service.name!,
                                                  style: fonts.smallSemLink
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  service.decodedDescription,
                                                  style:
                                                      fonts.smallLink.copyWith(
                                                    color: colors.neutral600,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  (widget.isUSD)
                                                      ? "${formatNumber(service.priceUsd, isDecimal: true)} USD"
                                                      : "${formatNumber(service.priceUzs)} UZS",
                                                  style:
                                                      fonts.smallLink.copyWith(
                                                    color: colors.primary900,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          AnimationButtonEffect(
                                            onTap: () {
                                              setState(() {
                                                if (_servicesProvider
                                                    .selectedServices
                                                    .contains(service)) {
                                                  _servicesProvider
                                                      .removeService(service);
                                                  _serviceIdsProvider
                                                      .removeServiceId(
                                                          service.id!);
                                                  chose--;
                                                } else {
                                                  _servicesProvider
                                                      .addService(service);
                                                  _serviceIdsProvider
                                                      .addServiceId(
                                                          service.id!);
                                                  chose++;
                                                }
                                                selectedServiceIDCatch.clear();
                                                selectedServiceIDCatch.addAll(
                                                    _serviceIdsProvider
                                                        .selectedServiceIds);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(12.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                color: _servicesProvider
                                                        .selectedServices
                                                        .contains(service)
                                                    ? colors.error500
                                                    : colors.neutral200,
                                              ),
                                              child: _servicesProvider
                                                      .selectedServices
                                                      .contains(service)
                                                  ? icons.check
                                                      .svg(color: colors.shade0)
                                                  : icons.plus.svg(
                                                      color: colors.primary900),
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
                        emptyWidgetModel:
                            ErrorWidgetModel(title: "", subtitle: ""),
                        status: FormzSubmissionStatus.success,
                      ),
                    ),
                  );
                },
              ),
              if (chose > 0) ...[
                BlocBuilder<BookingBloc, BookingState>(
                  builder: (context, state) {
                    if (state.categoryServices.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "count_services_selected"
                                    .tr(namedArgs: {"count": "$chose"}),
                                style: fonts.xSmallLink.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AnimationButtonEffect(
                                onTap: () {
                                  if (!mounted) return;
                                  showModalBottomSheet(
                                    context: context,
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                    ),
                                    builder: (context) {
                                      return ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                        ),
                                        child: SingleChildScrollView(
                                          child: ServiceSelectionModal(
                                            selectedServices: selectedServices,
                                            chose: chose,
                                            onRemoveService: (service) {
                                              if (!mounted) return;
                                              setState(() {
                                                _servicesProvider
                                                    .removeService(service);
                                                _serviceIdsProvider
                                                    .removeServiceId(
                                                        service.id!);
                                                selectedServices
                                                    .remove(service);
                                                selectedServiceIDCatch
                                                    .remove(service.id!);
                                                chose--;
                                              });
                                            },
                                          ),
                                        ),
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
                          CButton(
                            title: "next".tr(),
                            onTap: () async {
                              final selectedServices = state.categoryServices
                                  .expand((category) => category.services)
                                  .where((service) => selectedServiceIDCatch
                                      .contains(service.id))
                                  .toList();
                              final requiresCallBack = selectedServices.any(
                                  (service) =>
                                      service.canReceiveCallBack == true);
                              if (requiresCallBack) {
                                bool? confirmCallBack = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: colors.shade0,
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          "Оставьте свой номер телефона и мы вам перезвоним"
                                              .tr(),
                                          style: fonts.xSmallMain
                                              .copyWith(fontSize: 14.sp),
                                        ),
                                        12.h.verticalSpace,
                                        Text("contact_phone_number".tr(),
                                            style: fonts.regularLink),
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
                                          formatter: <TextInputFormatter>[
                                            InternationalPhoneFormatter()
                                          ],
                                          hintText: '+998',
                                          validator: (String? text) {},
                                        ),
                                        30.h.verticalSpace,
                                        CButton(
                                          title: "send".tr(),
                                          onTap: () async {
                                            final phone =
                                                _phoneNumberController.text;
                                            final serviceIds =
                                                selectedServiceIDCatch.toList();

                                            final response = await http.post(
                                              Uri.parse(
                                                  'https://his.uicgroup.tech/apiweb/help/call'),
                                              headers: {
                                                'Content-Type':
                                                    'application/json',
                                              },
                                              body: jsonEncode({
                                                'phone': phone,
                                                'service_ids': serviceIds,
                                              }),
                                            );

                                            // ignore: use_build_context_synchronously
                                            Navigator.of(context).pop();

                                            if (response.statusCode == 200) {
                                              showDialog(
                                                // ignore: use_build_context_synchronously
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        colors.shade0,
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            "assets/icons/done.svg"),
                                                        8.h.verticalSpace,
                                                        Text("Заявка оставлена",
                                                            style: fonts
                                                                .mediumMain),
                                                        4.h.verticalSpace,
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          "В скором времени мы вам перезвоним по поводу вашей заявки",
                                                          style:
                                                              fonts.xSmallMain,
                                                        ),
                                                        30.h.verticalSpace,
                                                        CButton(
                                                          title: "back".tr(),
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const MainPage(
                                                                        index:
                                                                            0),
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
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        "Ошибка отправки данных")),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    actions: [],
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppointmentPage(
                                      index: 2,
                                      selectedServiceIds:
                                          selectedServiceIDCatch.toSet(),
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
            ],
          ),
        );
      },
    );
  }
}
