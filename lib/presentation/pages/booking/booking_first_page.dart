import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_progress_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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
                          text: 'step'
                              .tr(namedArgs: {"count": "1", "total": "5"}),
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
                ],
              ),
            ),
            BlocBuilder<BookingBloc, BookingState>(
              buildWhen: (previous, current) {
                return previous.selectedServiceId !=
                        current.selectedServiceId ||
                    previous.bookingTypes != current.bookingTypes;
              },
              builder: (context, state) {
                if (state.loading) {
                  return CircularProgressIndicator(color: colors.error50);
                }
                if (state.error) {
                  return Center(
                    child: Text("no_result_found".tr()),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: state.bookingTypes.length,
                    itemBuilder: (context, index) {
                      final BookingTypeModel item = state.bookingTypes[index];
                      return MedicalDirectionItem(
                        title: item.name,
                        subtitle: "",
                        iconPath: item.icon,
                        onTap: () {
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(true);

                          context
                              .read<BookingBloc>()
                              .add(BookingEvent.selectService(id: item.id));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookingSecondPage(
                                        isUSD: false,
                                        serviceId: item.id,
                                      ))).then((_) {
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(false);
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
