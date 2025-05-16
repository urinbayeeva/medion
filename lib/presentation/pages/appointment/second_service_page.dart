import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondServicePage extends StatefulWidget {
  final int id;
  final bool? isAdded;
  final VoidCallback onTap;
  final bool isUSD;

  const SecondServicePage({
    super.key,
    this.isAdded,
    required this.onTap,
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
  int chose = 0;
  int? selectedIndex;
  List<Service> selectedServices = [];
  final List<int> selectedServiceIDCatch = [];

  @override
  void initState() {
    super.initState();
    _serviceIdsProvider =
        Provider.of<SelectedServiceIdsProvider>(context, listen: false);
    _servicesProvider =
        Provider.of<SelectedServicesProvider>(context, listen: false);
    _serviceIdsProvider.addListener(_updateSelectedServices);
    _updateSelectedServices();
  }

  @override
  void dispose() {
    _serviceIdsProvider.removeListener(_updateSelectedServices);
    _refreshController.dispose();
    super.dispose();
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
    });
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
                    onRefresh: () async {
                      if (!mounted) return;
                      final selectedId =
                          context.read<BookingBloc>().state.selectedServiceId;
                      context.read<BookingBloc>().add(
                            BookingEvent.fetchCategoryServices(id: selectedId!),
                          );
                      _refreshController.refreshCompleted();
                    },
                    refreshController: _refreshController,
                    padding: EdgeInsets.only(top: 16.w),
                    itemBuilder: (index, category) {
                      var item = state.categoryServices[index];

                      return CustomExpansionListTile(
                        title: item.name is bool ? "" : item.name.toString(),
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
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
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
                                              style:
                                                  fonts.smallSemLink.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // Text(
                                            //   'Test description',
                                            //   style: fonts.smallLink.copyWith(
                                            //     color: colors.neutral600,
                                            //     fontSize: 11.sp,
                                            //     fontWeight: FontWeight.w400,
                                            //   ),
                                            //   softWrap: true,
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                            Text(
                                              widget.isUSD
                                                  ? "${formatNumber(service.priceUzs)} UZS"
                                                  : "${formatNumber(service.priceUsd, isDecimal: true)} USD",
                                              style: fonts.smallLink.copyWith(
                                                  color: colors.primary900,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.sp),
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
                                                  .removeServiceId(service.id!);
                                              chose--;
                                            } else {
                                              _servicesProvider
                                                  .addService(service);
                                              _serviceIdsProvider
                                                  .addServiceId(service.id!);
                                              chose++;
                                            }
                                            selectedServiceIDCatch.clear();
                                            selectedServiceIDCatch.addAll(
                                                _serviceIdsProvider
                                                    .selectedServiceIds);
                                            print(
                                                "Updated : $selectedServiceIDCatch");
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
                    data: state.categoryServices,
                    emptyWidgetModel: ErrorWidgetModel(title: "", subtitle: ""),
                    status: FormzSubmissionStatus.inProgress,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                width: double.infinity,
                color: chose >= 1 ? null : colors.shade0,
                decoration: chose >= 1
                    ? BoxDecoration(
                        boxShadow: colors.shadowMMMM,
                        color: colors.shade0,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      )
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (chose >= 1) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "count_services_selected"
                                .tr(namedArgs: {"count": "$chose"}),
                            style: fonts.xSmallLink.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                          AnimationButtonEffect(
                            onTap: () {
                              if (!mounted) return;
                              showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                enableDrag: true,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    child: ServiceSelectionModal(
                                      selectedServices: selectedServices,
                                      chose: chose,
                                      onRemoveService: (service) {
                                        if (!mounted) return;
                                        setState(() {
                                          _servicesProvider
                                              .removeService(service);
                                          _serviceIdsProvider
                                              .removeServiceId(service.id!);
                                          selectedServices.remove(service);
                                          selectedServiceIDCatch
                                              .remove(service.id!);
                                          chose--;
                                        });
                                      },
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
                    ],
                    CButton(
                      title: "next".tr(),
                      onTap: () {
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
                      },
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
