import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/booking/phone_callback_dialog.dart';
import 'package:medion/presentation/pages/home/directions/widgets/service_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/format_currency.dart';

class DirectionInfoPage extends StatefulWidget {
  final int id;
  final String? name;

  const DirectionInfoPage({super.key, required this.id, this.name});

  @override
  State<DirectionInfoPage> createState() => _DirectionInfoPageState();
}

class _DirectionInfoPageState extends State<DirectionInfoPage> {
  final ValueNotifier<String> _tabItem = ValueNotifier('');
  final ValueNotifier<int> _index = ValueNotifier(0);
  final ValueNotifier<bool> _selectItemHelper = ValueNotifier(false);
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

  void select(BookingState state) {
    if (_selectItemHelper.value == false) {
      final visibleItem = state.items.firstWhere(
        (item) => item.canSee,
        orElse: () => state.items.first,
      );
      _tabItem.value = visibleItem.title;
    }
    _selectItemHelper.value = true;
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

  final ScrollController _controller = ScrollController();

  void tabForScrollSection(int index, List<DirectionScrollingItem> tabs) {
    final GlobalKey key = tabs[index].itemKey;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final context = key.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: 0,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<BookingBloc, BookingState>(
          buildWhen: (o, n) {
            final status = o.fetchHomePageBookingDoctorsStatus != n.fetchHomePageBookingDoctorsStatus;
            final model = o.medicalModel != n.medicalModel;
            final item = o.items != n.items;

            return status || model || item;
          },
          builder: (context, state) {
            if (state.fetchHomePageBookingDoctorsStatus.isInProgress ||
                state.fetchHomePageBookingDoctorsStatus.isInitial) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: colors.shade0,
                  foregroundColor: colors.darkMode900,
                  scrolledUnderElevation: 0,
                  leading: WScaleAnimation(
                    child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                    onTap: () {
                      Navigator.of(context).pop();
                      context.read<BottomNavBarController>().changeNavBar(false);
                    },
                  ),
                  title: Text(widget.name ?? "doctors".tr(), style: fonts.regularMain),
                ),
                backgroundColor: colors.backgroundColor,
                body: _buildShimmerView(colors),
              );
            }
            if (state.items.every((item) => !item.canSee || state.medicalModel == null)) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: colors.shade0,
                  foregroundColor: colors.darkMode900,
                  scrolledUnderElevation: 0,
                  leading: WScaleAnimation(
                    child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                    onTap: () {
                      Navigator.of(context).pop();
                      context.read<BottomNavBarController>().changeNavBar(false);
                    },
                  ),
                  title: Text(widget.name ?? "doctors".tr(), style: fonts.regularMain),
                ),
                backgroundColor: colors.backgroundColor,
                body: Center(
                  child: Text("no_result_found".tr(), style: fonts.regularMain),
                ),
              );
            }
            return DefaultTabController(
              length: state.items.where((item) => item.canSee).length,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: colors.shade0,
                  foregroundColor: colors.darkMode900,
                  scrolledUnderElevation: 0,
                  leading: WScaleAnimation(
                    child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                    onTap: () {
                      Navigator.of(context).pop();
                      context.read<BottomNavBarController>().changeNavBar(false);
                    },
                  ),
                  title: Text(widget.name ?? "doctors".tr(), style: fonts.regularMain),
                  actions: [
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
                    12.w.horizontalSpace,
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size(1.sw, 42.h),
                    child: ValueListenableBuilder(
                      valueListenable: _index,
                      builder: (ctx, val, child) {
                        return CustomTabbarBlack(
                          tabs: state.items.where((e) => e.canSee).map((e) => e.title.tr()).toList(),
                          onTap: (val) {
                            _index.value = val;
                            tabForScrollSection(val, state.items);
                          },
                          selectedIndex: _index.value,
                          padding: EdgeInsets.only(right: 12.w),
                          labelPadding: EdgeInsets.only(right: 16.w, left: 12),
                        );
                      },
                    ),
                  ),
                ),
                backgroundColor: colors.backgroundColor,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    6.h.verticalSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _controller,
                        child: Column(
                          children: [
                            ...List.generate(
                              state.items.length,
                              (index) {
                                final item = state.items[index];
                                return Column(
                                  key: item.itemKey,
                                  children: [
                                    if (item.checker.isDiscount && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            child: Text(
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          DirectionDiscountGrid(state: state, colors: colors, fonts: fonts),
                                        ],
                                      )
                                    },
                                    if (item.checker.isInfo && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            child: Text(
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          CContainer(
                                            margin: EdgeInsets.symmetric(horizontal: 12.w),
                                            width: 1.sw,
                                            text: state.medicalModel!.decodedTitle,
                                          ),
                                        ],
                                      )
                                    },
                                    if (item.checker.isDoctors && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            child: Text(
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          DirectionDoctorsGrid(state: state),
                                        ],
                                      )
                                    },
                                    if (item.checker.isService && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            child: Text(
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          _buildServicesList(state),
                                        ],
                                      )
                                    },
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: BlocBuilder<BookingBloc, BookingState>(
                  builder: (context, state) {
                    if (selectedServiceIds.isEmpty || state.medicalModel == null) {
                      return const SizedBox.shrink();
                    }
                    return _buildSelectedServicesContainer(context, state, colors, fonts);
                  },
                ),
              ),
            );
          },
        );
      },
    );
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
              itemBuilder: (_, __) => ShimmerContainer(
                height: 200.h,
                borderRadius: 8.r,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 3,
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

  Widget _buildServicesList(BookingState state) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 6),
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
    CustomColorSet colors,
    FontSet fonts,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.shade0,
        boxShadow: Style.shadowMMMM,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
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
              ).then(
                (value) {
                  if (value != null && value is Set<int>) {
                    setState(() => selectedServiceIds = value);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _showSelectedServicesBottomSheet(
    BuildContext context,
    BookingState state,
    CustomColorSet colors,
    FontSet fonts,
  ) {
    final selectedServices =
        state.medicalModel!.services.where((service) => selectedServiceIds.contains(service.id ?? -1)).toList();

    showModalBottomSheet(
      backgroundColor: colors.shade0,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "count_services_selected".tr(namedArgs: {"count": selectedServiceIds.length.toString()}),
                style: fonts.regularSemLink.copyWith(fontSize: 14.sp, color: colors.primary900),
              ),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedServices.length,
                    separatorBuilder: (context, index) => const CDivider(),
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
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class DirectionScrollingItem {
  final String title;
  final GlobalKey itemKey;
  final bool canSee;
  final DirectionInfoEnum checker;

  const DirectionScrollingItem({
    required this.title,
    required this.itemKey,
    required this.checker,
    this.canSee = false,
  });
}

enum DirectionInfoEnum {
  info,
  doctors,
  services,
  discounts;

  bool get isInfo => this == DirectionInfoEnum.info;

  bool get isDoctors => this == DirectionInfoEnum.doctors;

  bool get isService => this == DirectionInfoEnum.services;

  bool get isDiscount => this == DirectionInfoEnum.discounts;
}

class DirectionDoctorsGrid extends StatelessWidget {
  const DirectionDoctorsGrid({super.key, required this.state});

  final BookingState state;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controllers) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 0.9.sw,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 355.h,
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
                      name: doctor.name!,
                      profession: doctor.jobName!,
                      status: "",
                      image: doctor.image!,
                      id: doctor.id!,
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
          ),
        );
      },
    );
  }
}

class DirectionDiscountGrid extends StatelessWidget {
  const DirectionDiscountGrid({super.key, required this.state, required this.colors, required this.fonts});

  final BookingState state;
  final CustomColorSet colors;
  final FontSet fonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: state.medicalModel!.discount.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.67.h,
        ),
        itemBuilder: (context, index) {
          final discount = state.medicalModel!.discount[index];
          final endDateFormatted = _formatDiscountDate(discount.discountEndDate.toString());
          return SizedBox(
            width: 165.w,
            child: DiscountCard(
              onTap: () {
                log("ID: ${discount.id}");

                Navigator.push(
                  context,
                  AppRoutes.getInfoViewAboutHealth(
                    id: discount.id,
                    type: ContentTypeEnum.discount,
                  ),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DiscountPage(discountId: discount.id)),
                // );
              },
              colors: colors,
              fonts: fonts,
              title: discount.name + discount.name,
              date: "Акция до {date}".tr(namedArgs: {"date": endDateFormatted}),
              image: discount.image,
            ),
          );
        },
      ),
    );
  }

  String _formatDiscountDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'дата не указана'.tr();
    }
    try {
      return DateFormat('dd.MM.yyyy').format(DateTime.parse(date));
    } catch (e) {
      return 'неверный формат даты'.tr();
    }
  }
}
