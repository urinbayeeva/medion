import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(const BookingEvent.fetchBookingTypes());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Widget _buildShimmerItem() {
    return const Column(
      children: [
        ListTile(
          leading: ShimmerView(
            child: ShimmerContainer(
              width: 40,
              height: 40,
              borderRadius: 8,
            ),
          ),
          title: ShimmerView(
            forText: true,
            child: ShimmerContainer(
              height: 14,
              width: 120,
              borderRadius: 4,
            ),
          ),
        ),
        Divider(height: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("services".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<BookingBloc, BookingState>(
            buildWhen: (previous, current) {
              final status = previous.fetchBookingTypesStatus != current.fetchBookingTypesStatus;
              final id = previous.selectedServiceId != current.selectedServiceId;
              final type = previous.bookingTypes != current.bookingTypes;
              return id || type || status;
            },
            builder: (context, state) {
              if (state.fetchBookingTypesStatus.isInitial || state.fetchBookingTypesStatus.isInProgress) {
                return Column(
                  children: [
                    10.h.verticalSpace,
                    ...List.generate(6, (_) => _buildShimmerItem()),
                  ],
                );
              }
              if (state.bookingTypes.isEmpty || state.fetchBookingTypesStatus.isFailure) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.h.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border(
                            bottom: BorderSide(width: 1, color: colors.neutral400),
                          ),
                        ),
                        child: Column(
                          children: [
                            ...List.generate(
                              state.bookingTypes.length,
                              (index) {
                                final item = state.bookingTypes[index];
                                return Column(
                                  children: [
                                    AnimationButtonEffect(
                                      onTap: () {
                                        final bottomNavBarController = context.read<BottomNavBarController>();
                                        bottomNavBarController.changeNavBar(true);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MedServiceChoose(
                                              serviceTypeId: item.id,
                                            ),
                                          ),
                                        ).then((_) {
                                          context.read<BottomNavBarController>().changeNavBar(false);
                                        });
                                      },
                                      child: ListTile(
                                        leading: item.icon == null || item.icon == ""
                                            ? icons.diagnostic.svg(color: colors.error500)
                                            : CachedNetworkImage(
                                                width: 40.w,
                                                height: 40.h,
                                                imageUrl: item.icon!,
                                              ),
                                        title: Text(
                                          item.name,
                                          style: fonts.regularLink,
                                        ),
                                      ),
                                    ),
                                    if (index != state.bookingTypes.length - 1)
                                      Divider(
                                        color: colors.neutral400,
                                        height: 1,
                                      ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      10.h.verticalSpace,
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
