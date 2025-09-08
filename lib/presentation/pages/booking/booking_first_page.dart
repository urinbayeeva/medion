import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/booking/booking_second_page.dart';
import 'package:medion/presentation/pages/booking/widgets/show_selected_service.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class BookingFirstPage extends StatefulWidget {
  const BookingFirstPage({super.key});

  @override
  State<BookingFirstPage> createState() => _BookingFirstPageState();
}

class _BookingFirstPageState extends State<BookingFirstPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final RefreshController _refreshShimmer = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(const BookingEvent.fetchBookingTypes());
  }

  @override
  void dispose() {
    _refreshShimmer.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "select_service_type".tr(),
                isBack: false,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
                bottom: Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'step'.tr(namedArgs: {"count": "1", "total": "5"}),
                            style: fonts.xSmallLink.copyWith(
                              color: colors.neutral600,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "  ${"selecting_service_type".tr()}",
                            style: fonts.xSmallLink.copyWith(
                              color: colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomProgressBar(count: 1, allCount: 5),
                  ],
                ),
              ),
              BlocBuilder<BookingBloc, BookingState>(
                buildWhen: (previous, current) {
                  final selectedService = previous.selectedServiceId != current.selectedServiceId;
                  final booking = previous.bookingTypes != current.bookingTypes;
                  final status = previous.fetchBookingTypesStatus != current.fetchBookingTypesStatus;

                  return selectedService || booking || status;
                },
                builder: (_, state) {
                  if (state.fetchBookingTypesStatus.isInitial || state.fetchBookingTypesStatus.isInProgress) {
                    return Expanded(
                      child: SmartRefresher(
                        onRefresh: () {
                          context.read<BookingBloc>().add(const BookingEvent.fetchBookingTypes());
                          _refreshShimmer.refreshCompleted();
                        },
                        controller: _refreshShimmer,
                        enablePullDown: true,
                        header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: colors.neutral300.withValues(alpha: 0.3),
                              highlightColor: colors.shade0,
                              child: ShimmerContainer(
                                margin: EdgeInsets.symmetric(vertical: 8.h),
                                borderRadius: 12.r,
                                child: Row(
                                  children: [
                                    ShimmerContainer(
                                      width: 40.w,
                                      height: 40.h,
                                      borderRadius: 8.r,
                                      margin: EdgeInsets.all(8.w),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ShimmerContainer(
                                            width: 150.w,
                                            height: 16.h,
                                            borderRadius: 4.r,
                                            margin: EdgeInsets.only(bottom: 8.h),
                                          ),
                                          ShimmerContainer(
                                            width: 100.w,
                                            height: 12.h,
                                            borderRadius: 4.r,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (state.fetchBookingTypesStatus.isFailure || state.bookingTypes.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 230.h),
                        child: EmptyState(title: "no_results_found".tr()),
                      ),
                    );
                  }
                  return Expanded(
                    child: SmartRefresher(
                      onRefresh: () {
                        context.read<BookingBloc>().add(const BookingEvent.fetchBookingTypes());
                        _refreshController.refreshCompleted();
                      },
                      controller: _refreshController,
                      enablePullDown: true,
                      header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: state.bookingTypes.length,
                        itemBuilder: (__, index) {
                          final BookingTypeModel item = state.bookingTypes[index];
                          return MedicalDirectionItem(
                            title: item.name,
                            subtitle: "",
                            iconPath: item.icon,
                            onTap: () {
                              context.read<BookingBloc>().add(BookingEvent.selectService(id: item.id));

                              Navigator.of(context, rootNavigator: true)
                                  .push(
                                MaterialPageRoute(
                                  builder: (context) => BookingSecondPage(
                                    isUSD: false,
                                    serviceName: item.name,
                                    serviceId: item.id,
                                    show: true,
                                  ),
                                ),
                              )
                                  .then((_) {
                                context.read<BottomNavBarController>().changeNavBar(false);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<BookingBloc, BookingState>(
                buildWhen: (o, n) {
                  final services = o.selectedServices != n.selectedServices;
                  final total = o.totalSelectedCount != n.totalSelectedCount;
                  final length = o.services.length != n.services.length;
                  return services || total || length;
                },
                builder: (context, state) {
                  return AnimatedContainer(
                    width: 1.sw,
                    height: (state.services.isEmpty) ? 0 : 116.h,
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: colors.shade0,
                      border: Border.all(color: colors.neutral200),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "count_services_selected".tr(namedArgs: {"count": "${state.services.length}"}),
                            style: fonts.xSmallLink.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                          WScaleAnimation(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (ctx) {
                                  return ShowSelectedService(
                                    bloc: context.read<BookingBloc>(),
                                    colors: colors,
                                    fonts: fonts,
                                    icons: icons,
                                  );
                                },
                              );
                            },
                            child: icons.right.svg(height: 22.h, width: 22.w),
                          ),
                        ],
                      ),
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
