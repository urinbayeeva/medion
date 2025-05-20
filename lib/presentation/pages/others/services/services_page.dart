import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
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
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "services".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            12.h.verticalSpace,
            BlocBuilder<BookingBloc, BookingState>(
              buildWhen: (previous, current) =>
                  previous.selectedServiceId != current.selectedServiceId ||
                  previous.bookingTypes != current.bookingTypes,
              builder: (context, state) {
                final isLoading = state.bookingTypes.isEmpty;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.shade0,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border(
                        bottom: BorderSide(width: 1, color: colors.neutral400),
                      ),
                    ),
                    child: isLoading
                        ? Column(
                            children:
                                List.generate(6, (_) => _buildShimmerItem()),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: state.bookingTypes.length,
                            itemBuilder: (context, index) {
                              final item = state.bookingTypes[index];
                              return Column(
                                children: [
                                  AnimationButtonEffect(
                                    onTap: () {
                                      final bottomNavBarController = context
                                          .read<BottomNavBarController>();
                                      bottomNavBarController.changeNavBar(true);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MedServiceChoose(
                                            serviceTypeId: item.id,
                                          ),
                                        ),
                                      ).then((_) {
                                        context
                                            .read<BottomNavBarController>()
                                            .changeNavBar(false);
                                      });
                                    },
                                    child: ListTile(
                                      leading:
                                          item.icon == null || item.icon == ""
                                              ? icons.diagnostic
                                                  .svg(color: colors.error500)
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
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
