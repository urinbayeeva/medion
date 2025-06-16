import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/booking/booking_second_page.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingFirstPage extends StatefulWidget {
  const BookingFirstPage({super.key});

  @override
  State<BookingFirstPage> createState() => _BookingFirstPageState();
}

class _BookingFirstPageState extends State<BookingFirstPage> {
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

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (ctx, colors, fonts, icons, controller) {
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
                  const CustomProgressBar(
                    count: 1,
                    allCount: 5,
                  ),
                ],
              ),
            ),
            BlocBuilder<BookingBloc, BookingState>(
              buildWhen: (previous, current) {
                final selectedService = previous.selectedServiceId != current.selectedServiceId;
                final booking = previous.bookingTypes != current.bookingTypes;
                final loading = previous.loading != current.loading;
                final error = previous.error != current.error;

                return selectedService || booking || loading || error;
              },
              builder: (_, state) {
                if (state.loading) {
                  return Expanded(
                    child: ShimmerView(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: 5, // Show 5 shimmer placeholders
                        itemBuilder: (context, index) {
                          return ShimmerContainer(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            height: 80.h, // Approximate height of MedicalDirectionItem
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
                          );
                        },
                      ),
                    ),
                  );
                }

                return Expanded(
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
                          context.read<BottomNavBarController>().changeNavBar(true);

                          context.read<BookingBloc>().add(BookingEvent.selectService(id: item.id));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookingSecondPage(
                                        isUSD: false,
                                        serviceId: item.id,
                                        show: true,
                                      ))).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        },
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
