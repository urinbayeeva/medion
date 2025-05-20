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
import 'package:medion/domain/models/booking/booking_type_model.dart'
    show Service;
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/c_outlined_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/pages/main/main_page.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondServicePage extends StatefulWidget {
  final int id;
  final bool isUSD;

  const SecondServicePage({
    super.key,
    required this.id,
    this.isUSD = false,
  });

  @override
  State<SecondServicePage> createState() => _SecondServicePageState();
}

class _SecondServicePageState extends State<SecondServicePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late final SelectedServiceIdsProvider _serviceIdsProvider;
  late final SelectedServicesProvider _servicesProvider;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController(text: "+998 ");
    _serviceIdsProvider =
        Provider.of<SelectedServiceIdsProvider>(context, listen: false);
    _servicesProvider =
        Provider.of<SelectedServicesProvider>(context, listen: false);
    _serviceIdsProvider.addListener(_updateSelectedServices);
  }

  @override
  void dispose() {
    _serviceIdsProvider.removeListener(_updateSelectedServices);
    _refreshController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _updateSelectedServices() {
    if (!mounted) return;
    setState(() {});
  }

  int get _selectedServicesCount => _servicesProvider.selectedServices.length;

  Future<void> _handleRefresh() async {
    if (!mounted) return;
    final selectedId = context.read<BookingBloc>().state.selectedServiceId;
    context
        .read<BookingBloc>()
        .add(BookingEvent.fetchCategoryServices(id: selectedId!));
    _refreshController.refreshCompleted();
  }

  Future<void> _handleServiceSelection(Service service) async {
    setState(() {
      if (_servicesProvider.selectedServices.contains(service)) {
        _servicesProvider.removeService(service);
        _serviceIdsProvider.removeServiceId(service.id!);
      } else {
        _servicesProvider.addService(service);
        _serviceIdsProvider.addServiceId(service.id!);
      }
    });
  }

  Future<bool> _showCallBackDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Обратный звонок".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  textAlign: TextAlign.center,
                  "Оставьте свой номер телефона и мы вам перезвоним".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Text("contact_phone_number".tr(),
                    style: Theme.of(context).textTheme.labelLarge),
                CustomTextField(
                  autoFocus: true,
                  title: "",
                  keyboardType: TextInputType.phone,
                  controller: _phoneNumberController,
                  formatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(13),
                  ],
                  hintText: '+998',
                ),
                const SizedBox(height: 30),
                CButton(
                  title: "send".tr(),
                  onTap: () async {
                    final phone = _phoneNumberController.text;
                    if (phone.isEmpty || phone.length < 13) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("Please enter a valid phone number".tr())),
                      );
                      return;
                    }

                    try {
                      final response = await http.post(
                        Uri.parse('${Constants.baseUrlP}/help/call'),
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode({
                          'phone': phone,
                          'service_ids':
                              _serviceIdsProvider.selectedServiceIds.toList(),
                        }),
                      );

                      if (!mounted) return;

                      Navigator.of(context).pop(response.statusCode == 200);

                      if (response.statusCode == 200) {
                        _showSuccessDialog(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Ошибка отправки данных".tr())),
                        );
                      }
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Connection error".tr())),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/done.svg"),
            const SizedBox(height: 8),
            Text("Заявка оставлена",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(
              textAlign: TextAlign.center,
              "В скором времени мы вам перезвоним по поводу вашей заявки",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            CButton(
              title: "back".tr(),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainPage(index: 0)),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToAppointmentPage(BuildContext context) async {
    final requiresCallBack = _servicesProvider.selectedServices
        .any((service) => service.canReceiveCallBack == true);

    if (requiresCallBack) {
      final success = await _showCallBackDialog(context);
      if (success) return;
    }

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentPage(
          index: 2,
          selectedServiceIds: _serviceIdsProvider.selectedServiceIds.toSet(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocConsumer<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state.categoryServices.isNotEmpty) {
            setState(() {});
          }
        },
        builder: (context, state) {
          if (state.categoryServices.isEmpty) {
            return Center(
              child: Text(
                "no_result_found".tr(),
                style: Style.headlineMain(),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomListView(
                    onRefresh: _handleRefresh,
                    refreshController: _refreshController,
                    padding: EdgeInsets.only(top: 16.w),
                    itemBuilder: (index, category) {
                      final item = state.categoryServices[index];

                      return CustomExpansionListTile(
                        title: item.name?.toString() ?? "",
                        description: item.services.isEmpty
                            ? 'no_services_available'.tr()
                            : 'services_list'.tr(),
                        children: item.services.map((service) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 1, color: colors.neutral200),
                                bottom: BorderSide(
                                    width: 1, color: colors.neutral200),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          service.name ?? "",
                                          style: fonts.smallSemLink.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        4.h.verticalSpace,
                                        if (service.decodedDescription != "")
                                          Text(
                                            service.decodedDescription,
                                            style: fonts.smallSemLink.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        Text(
                                          !widget.isUSD
                                              ? "sum".tr(namedArgs: {
                                                  "amount":
                                                      "${formatNumber(service.priceUzs)}"
                                                })
                                              : "sum".tr(namedArgs: {
                                                  "amount":
                                                      "${formatNumber(service.priceUsd, isDecimal: true)}"
                                                }),
                                          style: fonts.smallLink.copyWith(
                                            color: colors.primary900,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        Text("with_vat".tr(),
                                            style: fonts.regularLink.copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  AnimationButtonEffect(
                                    onTap: () =>
                                        _handleServiceSelection(service),
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
                                      child: _servicesProvider.selectedServices
                                              .contains(service)
                                          ? icons.check
                                              .svg(color: colors.shade0)
                                          : icons.plus
                                              .svg(color: colors.primary900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                    data: state.categoryServices,
                    emptyWidgetModel: ErrorWidgetModel(title: "", subtitle: ""),
                    status: FormzSubmissionStatus.inProgress,
                  ),
                ),
              ),
              if (state.categoryServices.isNotEmpty)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colors.neutral200),
                    color: colors.shade0,
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
                            "count_services_selected".tr(namedArgs: {
                              "count": "$_selectedServicesCount"
                            }),
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
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.8,
                                ),
                                builder: (context) => ServiceSelectionModal(
                                  selectedServices:
                                      _servicesProvider.selectedServices,
                                  chose: _selectedServicesCount,
                                  onRemoveService: (service) {
                                    _servicesProvider.removeService(service);
                                    _serviceIdsProvider
                                        .removeServiceId(service.id!);
                                  },
                                  onRemoveAllServices: () {
                                    _servicesProvider.clearServices();
                                    _serviceIdsProvider.clearServiceIds();
                                  },
                                ),
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
                      const SizedBox(height: 12),
                      CustomButton(
                        borderRadius: 8.r,
                        title: "next".tr(),
                        isDisabled: _selectedServicesCount == 0,
                        onPressed: () => _navigateToAppointmentPage(context),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      );
    });
  }
}
