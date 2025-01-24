import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DirectionsPage extends StatefulWidget {
  const DirectionsPage({super.key});

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  @override
  void initState() {
    super.initState();

    context
        .read<BookingBloc>()
        .add(const BookingEvent.fetchHomePageServicesBooking());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                hasSearch: true,
                title: "Направления",
                centerTitle: true,
                isBack: true,
                trailing: icons.filter.svg(width: 24.w, height: 24.h),
              ),
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  children: [
                    BlocBuilder<BookingBloc, BookingState>(
                        builder: (context, state) {
                      if (state.homePageBookingCategory.isEmpty) {
                        return Center(
                          child: Lottie.asset("assets/anim/404.json"),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.homePageBookingCategory.length,
                        itemBuilder: (context, index) {
                          final item = state.homePageBookingCategory[index];

                          return MedicalDirectionItem(
                            onTap: () {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                              Navigator.push(
                                context,
                                AppRoutes.getDirectionInfoPage(id: item.id!),
                              ).then((_) {
                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(false);
                              });
                            },
                            title: item.name ?? "",
                            subtitle: "null",
                            iconPath: item.icon ?? "",
                          );
                        },
                      );
                    }),
                    60.h.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
