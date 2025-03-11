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
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/home/directions/widgets/service_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
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
    context
        .read<BookingBloc>()
        .add(BookingEvent.fetchHomePageServiceDoctors(id: widget.id));
  }

  Future<void> _initializeDBService() async {
    dbService = await DBService.create;
    setState(() {
      changeSum = dbService.getCurrencyPreference;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(builder: (context, state) {
      return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CAppBar(
                bordered: true,
                title: widget.name ?? "Loading...",
                centerTitle: true,
                onTap: () {
                  Navigator.pop(context);
                  context.read<BottomNavBarController>().changeNavBar(false);
                },
                isBack: true,
                trailing: Row(
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
                            child: icons.valyutaChange
                                .svg(width: 20.w, height: 20.h))),
                    6.w.horizontalSpace,
                    icons.filter.svg(width: 20.w, height: 20.h)
                  ],
                ),
              ),
              Expanded(
                child: state.medicalModel == null
                    ? _buildEmptyState()
                    : _buildContent(context, state, colors, fonts, icons),
              ),
              if (selectedServiceIds.isNotEmpty)
                _buildSelectedServicesContainer(context, state, colors, fonts),
              24.h.verticalSpace,
            ],
          ),
        );
      });
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "no_result_found".tr(),
        style: Style.headlineMain(),
      ),
    );
  }

  Widget _buildContent(BuildContext context, BookingState state, dynamic colors,
      dynamic fonts, dynamic icons) {
    final hasDoctors = state.medicalModel!.doctors.isNotEmpty;
    final hasDescription = state.medicalModel!.description?.isNotEmpty ?? false;
    final hasServices = state.medicalModel!.services.isNotEmpty;

    return SingleChildScrollView(
      padding: EdgeInsets.all(12.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: CustomToggle(
              iconList:
                  ['all_informations'.tr(), 'doctors'.tr(), 'services'.tr()]
                      .asMap()
                      .entries
                      .map((entry) => Text(
                            entry.value,
                            style: fonts.xSmallLink.copyWith(
                              color: selectedIndex == entry.key
                                  ? colors.shade0
                                  : colors.primary900,
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
            if (hasDescription) ...[
              _buildSectionTitle('all_informations'.tr(), fonts),
              CContainer(
                text: state.medicalModel!.description ?? "No description",
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
            if (!hasDescription && !hasDoctors && !hasServices)
              Center(
                child: Text(
                  "no_result_found".tr(),
                  style: Style.headlineMain(),
                ),
              ),
          ],
          if (selectedIndex == 1 && hasDoctors) ...[
            _buildSectionTitle('doctors'.tr(), fonts),
            _buildDoctorsGrid(state, icons),
          ] else if (selectedIndex == 1 && !hasDoctors)
            Align(
              alignment: Alignment.center,
              child: Text(
                "no_result_found".tr(),
                style: Style.regularMain(),
              ),
            ),
          if (selectedIndex == 2 && hasServices) ...[
            _buildSectionTitle('services'.tr(), fonts),
            _buildServicesList(state),
          ] else if (selectedIndex == 2 && !hasServices)
            Center(
              child: Text(
                "no_result_found".tr(),
                style: Style.regularMain(),
              ),
            ),
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
    if (state.medicalModel!.doctors.isEmpty) {
      return Center(
        child: Text(
          "no_doctors_found".tr(),
          style: Style.headlineMain(),
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.54,
      ),
      itemCount: state.medicalModel!.doctors.length,
      itemBuilder: (_, index) {
        final doctor = state.medicalModel!.doctors[index];
        return DoctorsItem(
          gender: "male",
          isInnerPageUsed: true,
          imagePath: doctor.image ?? icons.nonUser,
          onTap: () {},
          name: doctor.name ?? '',
          profession: doctor.jobName ?? "No profession",
          experience: "${doctor.experienceYears ?? "No experience"}",
        );
      },
    );
  }

  Widget _buildServicesList(BookingState state) {
    if (state.medicalModel!.services.isEmpty) {
      return Center(
        child: Text(
          "no_services_found".tr(),
          style: Style.headlineMain(),
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: state.medicalModel!.services.length,
      itemBuilder: (context, index) {
        final service = state.medicalModel!.services[index];
        final serviceId = service.id ?? index;
        return ServiceWidget(
          consultInfo: service.name ?? "No service name",
          consultPrice: changeSum
              ? "${formatNumber(service.priceUzs)} UZS"
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
        );
      },
    );
  }

  Widget _buildSelectedServicesContainer(
      BuildContext context, BookingState state, dynamic colors, dynamic fonts) {
    return Container(
      decoration: BoxDecoration(
          color: colors.shade0,
          boxShadow: Style.shadowMMMM,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r))),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GestureDetector(
        onTap: () =>
            _showSelectedServicesBottomSheet(context, state, colors, fonts),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "selected_services"
                      .tr(args: [selectedServiceIds.length.toString()]),
                  style: fonts.regularSemLink.copyWith(fontSize: 14.sp),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: colors.primary900,
                ),
              ],
            ),
            12.h.verticalSpace,
            CButton(
              title: "next".tr(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentPage(
                      index: 2,
                      selectedServiceIds: selectedServiceIds, // Pass Set<int>
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
      ),
    );
  }

  void _showSelectedServicesBottomSheet(
      BuildContext context, BookingState state, dynamic colors, dynamic fonts) {
    final selectedServices = state.medicalModel!.services
        .where((service) => selectedServiceIds.contains(service.id ?? -1))
        .toList();

    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Allows the column to grow as needed
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "selected_services"
                    .tr(args: [selectedServices.length.toString()]),
                style: fonts.headlineMain.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(selectedServices.length, (index) {
                  final service = selectedServices[index];
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 10.h), // Assuming bottom: 10.h
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align text and icon at top
                      children: [
                        Flexible(
                          child: Text(
                            service.name ?? "No service name",
                            style: fonts.xSmallLink.copyWith(
                              color: colors.primary900,
                              fontSize: 14.sp,
                            ),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(width: 10.w), // Space between text and icon
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedServiceIds.remove(service.id ?? -1);
                            });
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/trash.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
