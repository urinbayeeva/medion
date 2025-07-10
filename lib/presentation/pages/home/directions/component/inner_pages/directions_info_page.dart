import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_filter.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/appointment/doctor_time_and_service.dart';
import 'package:medion/presentation/pages/booking/phone_callback_dialog.dart';
import 'package:medion/presentation/pages/home/directions/widgets/service_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/format_currency.dart';

class DirectionInfoPage extends StatefulWidget {
  final int id;
  final String? name;

  const DirectionInfoPage({super.key, required this.id, this.name});

  @override
  State<DirectionInfoPage> createState() => _DirectionInfoPageState();
}

class _DirectionInfoPageState extends State<DirectionInfoPage> {
  int selectedIndex = 0;
  bool changeSum = false;
  List<int> savedIds = [];
  double turns = 0.0;
  Set<int> selectedServiceIds = {};

  late DBService dbService;

  @override
  void initState() {
    super.initState();
    _initializeDBService();
    context.read<BookingBloc>().add(BookingEvent.fetchHomePageServiceDoctors(id: widget.id));
  }

  void _showPhoneCallbackDialog(BuildContext context, dynamic colors, dynamic fonts, List<int> serviceIds) {
    showDialog(
      context: context,
      builder: (context) => PhoneCallbackDialog(serviceIds: serviceIds),
    );
  }

  Future<void> _initializeDBService() async {
    dbService = await DBService.create;
    setState(() {
      changeSum = dbService.getCurrencyPreference;
    });
  }

  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  String _formatDiscountDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'дата не указана'.tr();
    }
    try {
      return _dateFormat.format(DateTime.parse(date));
    } catch (e) {
      return 'неверный формат даты'.tr();
    }
  }

  String _currentFilter = 'All'; // Default filter value

  void _onFilterChanged(String filterValue) {
    setState(() {
      _currentFilter = filterValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CAppBar(
              bordered: true,
              title: widget.name ?? "",
              centerTitle: true,
              onTap: () {
                Navigator.pop(context);
                context.read<BottomNavBarController>().changeNavBar(false);
              },
              isBack: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: AnimationButtonEffect(
                      onTap: () {
                        setState(() {
                          turns += 2 / 4;
                          changeSum = !changeSum;
                          dbService.setCurrencyPreference(changeSum);
                        });
                      },
                      child: icons.valyutaChange.svg(width: 20.w, height: 20.h),
                    ),
                  ),
                  // 6.w.horizontalSpace,
                  // AnimationButtonEffect(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return CFilter(
                  //           currentFilter: _currentFilter,
                  //           onFilterChanged: _onFilterChanged,
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: icons.filter.svg(width: 20.w, height: 20.h),
                  // ),
                ],
              ),
            ),
            BlocBuilder<BookingBloc, BookingState>(
              builder: (context, state) {
                if (state.loading || state.medicalModel == null) {
                  return Expanded(child: _buildShimmerView(colors));
                }
                return Expanded(
                  child: _buildContent(context, state, colors, fonts, icons),
                );
              },
            ),
            BlocBuilder<BookingBloc, BookingState>(
              builder: (context, state) {
                if (selectedServiceIds.isEmpty || state.medicalModel == null) {
                  return const SizedBox.shrink();
                }
                return _buildSelectedServicesContainer(context, state, colors, fonts);
              },
            ),
            24.h.verticalSpace,
          ],
        ),
      );
    });
  }

  Widget _buildShimmerView(dynamic colors) {
    return ShimmerView(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(12.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for Toggle
            ShimmerContainer(
              width: double.infinity,
              height: 38.h,
              borderRadius: 8.r,
              margin: EdgeInsets.only(bottom: 12.h),
            ),
            // Shimmer for Section Title
            ShimmerContainer(
              width: 100.w,
              height: 20.h,
              borderRadius: 4.r,
              margin: EdgeInsets.only(bottom: 12.h),
            ),
            // Shimmer for Doctors Grid or Services List
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.48,
              ),
              itemCount: 4,
              // Show 4 placeholders
              itemBuilder: (_, __) => ShimmerContainer(
                height: 200.h,
                borderRadius: 8.r,
              ),
            ),
            // Shimmer for Services List
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 3,
              // Show 3 placeholders
              itemBuilder: (_, __) => ShimmerContainer(
                height: 80.h,
                borderRadius: 8.r,
                margin: EdgeInsets.only(bottom: 12.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "no_data_available".tr(),
        style: Style.headlineMain(),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BookingState state,
    dynamic colors,
    dynamic fonts,
    dynamic icons,
  ) {
    final hasDoctors = state.medicalModel!.doctors.isNotEmpty;
    final hasDescription = state.medicalModel!.description?.isNotEmpty ?? false;
    final hasServices = state.medicalModel!.services.isNotEmpty;
    final hasDiscount = state.medicalModel!.discount.isNotEmpty;

    return SingleChildScrollView(
      padding: EdgeInsets.all(12.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: CustomToggle(
              iconList: ['all_informations'.tr(), 'doctors'.tr(), 'services'.tr()]
                  .asMap()
                  .entries
                  .map((entry) => Text(
                        entry.value,
                        style: fonts.xSmallLink.copyWith(
                          color: selectedIndex == entry.key ? colors.shade0 : colors.primary900,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedIndex = value),
              current: selectedIndex,
              values: const [0, 1, 2],
              height: 38.h,
              indicatorSize: Size(double.infinity, 40.h),
              backgroundColor: colors.neutral200,
              indicatorColor: colors.error500,
              elevation: false,
            ),
          ),
          if (selectedIndex == 0) ...[
            if (!hasDoctors && !hasServices && !hasDescription) ...[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: Text(
                    "no_general_information_found".tr(),
                    style: fonts.regularMain.copyWith(
                      color: colors.primary900,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ] else ...[
              if (hasDescription) ...[
                _buildSectionTitle('all_informations'.tr(), fonts),
                CContainer(
                  text: state.medicalModel!.decodedTitle ?? "No description",
                ),
              ],
              if (hasDoctors) ...[
                _buildSectionTitle('doctors'.tr(), fonts),
                _buildDoctorsGrid(state, icons),
              ],
              if (hasServices) ...[
                _buildSectionTitle('services'.tr(), fonts),
                _buildServicesList(state),
              ],
              if (hasDiscount) ...[
                12.h.verticalSpace,
                Text(
                  "discounts".tr(),
                  style: fonts.regularMain,
                ),
                8.h.verticalSpace,
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state.medicalModel!.discount.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.2,
                  ),
                  itemBuilder: (context, index) {
                    final discount = state.medicalModel!.discount[index];
                    final endDateFormatted = _formatDiscountDate(discount.discountEndDate?.toString());

                    return ArticleCardWidget(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiscountPage(
                                      discountId: discount.id,
                                    )));
                      },
                      title: discount.name,
                      description: "Акция до {date}".tr(namedArgs: {
                        "date": endDateFormatted,
                      }),
                      image: discount.image,
                    );
                  },
                ),
              ]
            ],
          ],
          if (selectedIndex == 1) ...[
            if (hasDoctors) ...[
              _buildSectionTitle('doctors'.tr(), fonts),
              _buildDoctorsGrid(state, icons),
            ] else ...[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: Text(
                    "no_result_found".tr(),
                    style: fonts.regularMain.copyWith(
                      color: colors.primary900,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ],
          if (selectedIndex == 2) ...[
            if (hasServices) ...[
              _buildSectionTitle('services'.tr(), fonts),
              _buildServicesList(state),
            ] else ...[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: Text(
                    "no_result_found".tr(),
                    style: fonts.regularMain.copyWith(
                      color: colors.primary900,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ],
          SizedBox(height: selectedServiceIds.isNotEmpty ? 60.h : 0),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, dynamic fonts) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Text(title, style: fonts.regularSemLink),
    );
  }

  Widget _buildDoctorsGrid(BookingState state, dynamic icons) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.46,
      ),
      itemCount: state.medicalModel!.doctors.length,
      itemBuilder: (_, index) {
        final doctor = state.medicalModel!.doctors[index];
        return DoctorsItem(
          academicRank: doctor.academicRank ?? '',
          gender: "male",
          isInnerPageUsed: true,
          imagePath: doctor.image,
          onTap: () {
            Navigator.push(
              context,
              AppRoutes.getAboutDoctorPage(
                doctor.name!,
                doctor.jobName!,
                "",
                doctor.image!,
                doctor.id!,
              ),
            ).then((_) {});
          },
          name: doctor.name ?? '',
          profession: doctor.jobName ?? "No profession",
          experience: "experience".tr(namedArgs: {"count": doctor.experienceYears.toString()}),
          doctorID: doctor.id!,
          home: false,
        );
      },
    );
  }

  Widget _buildServicesList(BookingState state) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: state.medicalModel!.services.length,
      itemBuilder: (context, index) {
        final service = state.medicalModel!.services[index];
        final serviceId = service.id ?? index;
        return ServiceWidget(
          serviceId: serviceId,
          consultInfo: service.name ?? "No service name",
          consultPrice: !changeSum
              ? "sum".tr(namedArgs: {"amount": formatNumber(service.priceUzs)})
              : "${formatNumber(service.priceUzd, isDecimal: true)} USD",
          isSelected: selectedServiceIds.contains(serviceId),
          onTap: () {
            setState(() {
              if (selectedServiceIds.contains(serviceId)) {
                selectedServiceIds.remove(serviceId);
              } else {
                selectedServiceIds.add(serviceId);
              }
            });
          },
          canReceiveCallBack: service.canReceiveCallBack ?? false,
          onCallBackRequested: _showPhoneCallbackDialog,
        );
      },
    );
  }

  Widget _buildSelectedServicesContainer(
    BuildContext context,
    BookingState state,
    dynamic colors,
    dynamic fonts,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.shade0,
        boxShadow: Style.shadowMMMM,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Debugging: Add a hardcoded text to verify visibility
          GestureDetector(
            onTap: () => _showSelectedServicesBottomSheet(context, state, colors, fonts),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "count_services_selected".tr(namedArgs: {"count": selectedServiceIds.length.toString()}),
                  style: fonts.regularSemLink.copyWith(
                    fontSize: 14.sp,
                    color: colors.primary900, // Ensure contrast with background
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: colors.primary900,
                ),
              ],
            ),
          ),
          12.h.verticalSpace,
          CButton(
            title: "next".tr(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedServiceDoctorChose(
                    servicesID: selectedServiceIds.toList(),
                  ),
                ),
              ).then((value) {
                if (value != null && value is Set<int>) {
                  setState(() {
                    selectedServiceIds = value;
                  });
                }
              });
            },
          ),
        ],
      ),
    );
  }

  void _showSelectedServicesBottomSheet(
    BuildContext context,
    BookingState state,
    dynamic colors,
    dynamic fonts,
  ) {
    final selectedServices =
        state.medicalModel!.services.where((service) => selectedServiceIds.contains(service.id ?? -1)).toList();

    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Container(
            padding: EdgeInsets.all(16.w),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "count_services_selected".tr(namedArgs: {"count": selectedServiceIds.length.toString()}),
                style: fonts.regularSemLink.copyWith(
                  fontSize: 14.sp,
                  color: colors.primary900, // Ensure contrast with background
                ),
              ),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: selectedServices.length,
                    itemBuilder: (context, index) {
                      final service = selectedServices[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service.name ?? "No service name",
                                    style: fonts.xSmallLink.copyWith(
                                      color: colors.primary900,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  4.h.verticalSpace,
                                  Text(
                                    "sum".tr(namedArgs: {"amount": formatNumber(service.priceUzs)}),
                                    style: fonts.smallLink.copyWith(
                                      color: colors.primary900,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedServiceIds.remove(service.id ?? -1);
                                });
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                "assets/images/trash.png",
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => CDivider(),
                  ),
                ],
              )
            ]));
      },
    );
  }
}
