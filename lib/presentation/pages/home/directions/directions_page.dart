import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_filter.dart';
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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context
        .read<BookingBloc>()
        .add(const BookingEvent.fetchHomePageServicesBooking());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
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
                trailing: AnimationButtonEffect(
                    onTap: () {
                      context.read<BottomNavBarController>().changeNavBar(true);

                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const CFilter();
                          }).then((_) {
                        context
                            .read<BottomNavBarController>()
                            .changeNavBar(false);
                      });
                    },
                    child: icons.filter.svg(width: 20.w, height: 20.h)),
                onSearchChanged: _onSearchChanged,
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

                        final filteredItems = state.homePageBookingCategory
                            .where((item) => (item.name?.toLowerCase() ?? '')
                                .contains(_searchQuery))
                            .toList();

                        if (filteredItems.isEmpty && _searchQuery.isNotEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                20.h.verticalSpace,
                                Lottie.asset("assets/anim/404.json"),
                                Text(
                                  "Направления не найдены",
                                  style: fonts.regularMain.copyWith(
                                    color: colors.primary900,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];

                            return MedicalDirectionItem(
                              onTap: () {
                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(true);
                                Navigator.push(
                                  context,
                                  AppRoutes.getDirectionInfoPage(
                                      id: item.id!, name: item.name!),
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
                      },
                    ),
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
