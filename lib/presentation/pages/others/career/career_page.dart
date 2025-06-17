import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/career/widgets/resume_filling.dart';
import 'package:medion/presentation/pages/others/career/widgets/vacancy_card.dart';
import 'package:medion/presentation/pages/others/career/widgets/why_us_widget.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  final ValueNotifier<int> _tabIndex = ValueNotifier<int>(0);
  final CarouselSliderController _carouselController = CarouselSliderController();

  final List<String> whyUsTexts = [
    "понятная система оплаты, конкурентная заработная плата, своевременные выплаты и бонусы;",
    "возможность карьерного роста и профессионального развития;",
    "дружный коллектив и комфортные условия труда;",
    "современное оборудование и инновационные технологии;",
  ];

  @override
  void initState() {
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctorsJob());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: colors.backgroundColor,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CAppBar(
                  bordered: true,
                  title: "career".tr(),
                  centerTitle: true,
                  isBack: true,
                  trailing: SizedBox(width: 24.w),
                ),
                TabBar(
                  onTap: (index) => _tabIndex.value = index,
                  labelColor: colors.error500,
                  indicatorColor: colors.error500,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  tabs: [Tab(text: "med".tr()), Tab(text: "office".tr())],
                ),
                Expanded(
                  child: BlocBuilder<VacancyBloc, VacancyState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Мы внимательны к тому, что важно, и предлагаем: ", style: fonts.regularMain),
                                  12.h.verticalSpace,
                                  const Text(
                                    "Мы в сети многопрофильных клиник «Medion» всегда ждем в своей команде новых специалистов. У нас врачи растут, развиваются и постоянно повышают свой профессиональный уровень, участвуя в российских и международных конференциях",
                                  ),
                                  12.h.verticalSpace,
                                  ValueListenableBuilder(
                                    valueListenable: _tabIndex,
                                    builder: (BuildContext context, int value, Widget? child) {
                                      return VacanciesCards(
                                        index: _tabIndex.value,
                                        fonts: fonts,
                                        icons: icons,
                                        colors: colors,
                                        state: state,
                                        bloc: context.read<VacancyBloc>(),
                                      );
                                    },
                                  ),
                                  12.h.verticalSpace,
                                  Text("Вот почему стоит выбрать нас:", style: fonts.regularMain),
                                  8.h.verticalSpace,
                                  GridView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: whyUsTexts.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12.h,
                                      crossAxisSpacing: 12.w,
                                      childAspectRatio: 1,
                                    ),
                                    itemBuilder: (context, index) {
                                      return WhyUsWidget(text: whyUsTexts[index]);
                                    },
                                  ),
                                  20.h.verticalSpace,
                                ],
                              ),
                            ),

                            // Text("doctors".tr(), style: fonts.regularMain),
                            // 8.h.verticalSpace,
                            // BlocBuilder<DoctorBloc, DoctorState>(
                            //   builder: (context, state) {
                            //     return ListView.builder(
                            //       padding: EdgeInsets.zero,
                            //       shrinkWrap: true,
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       itemCount: state.doctorsJob.length,
                            //       itemBuilder: (context, index) {
                            //         final data = state.doctorsJob[index];
                            //         return CustomExpansionListTile(
                            //           title: data.name,
                            //           description: data.name + data.name,
                            //           children: [
                            //             Row(
                            //               children: [
                            //                 Column(
                            //                   mainAxisSize: MainAxisSize.min,
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text(
                            //                       data.id.toString(),
                            //                       style: fonts.smallMain,
                            //                     )
                            //                   ],
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         );
                            //       },
                            //     );
                            //   },
                            // ),
                            // 20.h.verticalSpace,

                            ResumeFilling(
                              bloc: context.read<VacancyBloc>(),
                              jobId: -1,
                              compId: -1,
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                            //   child: Column(
                            //     mainAxisSize: MainAxisSize.min,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text("Работа в Medion — это работа по любви!", style: fonts.regularMain),
                            //       8.h.verticalSpace,
                            //       CButton(
                            //         title: "reply".tr(),
                            //         onTap: () {},
                            //         // onTap: () => launchUrl(
                            //         //   Uri.parse("https://medion.uz/"),
                            //         //   mode: LaunchMode.externalApplication,
                            //         // ),
                            //       ),
                            //       20.h.verticalSpace,
                            //     ],
                            //   ),
                            // ),
                            // Text("Наши отделения", style: fonts.regularMain),
                            // 8.h.verticalSpace,
                            // BlocBuilder<HomeBloc, HomeState>(
                            //   builder: (context, state) {
                            //     if (state.loading) return _buildAddressShimmer();
                            //     return _buildAddressSection(context, colors, fonts, icons);
                            //   },
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
