import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/career/widgets/resume_filling.dart';
import 'package:medion/presentation/pages/others/career/widgets/vacancy_card.dart';
import 'package:medion/presentation/pages/others/career/widgets/why_us_widget.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  final ValueNotifier<int> _tabIndex = ValueNotifier<int>(0);
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    // context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctorsJob());
    context.read<VacancyBloc>().add(const VacancyEvent.fetchVacancies());
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
              title: Text("career".tr(), style: fonts.regularMain),
              bottom: TabBar(
                onTap: (index) => _tabIndex.value = index,
                labelColor: colors.error500,
                indicatorColor: colors.error500,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black,
                tabs: [Tab(text: "med".tr()), Tab(text: "office".tr())],
              ),
            ),
            body: BlocBuilder<VacancyBloc, VacancyState>(
              buildWhen: (o, n) {
                final status = o.vacancyStatus != n.vacancyStatus;
                final vacancies = o.vacancies != n.vacancies;
                return status || vacancies;
              },
              builder: (context, state) {
                return SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                  onRefresh: () {
                    context.read<VacancyBloc>().add(const VacancyEvent.fetchVacancies());
                    _refreshController.refreshCompleted();
                  },
                  child: SingleChildScrollView(
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
                              6.h.verticalSpace,
                              ...List.generate(
                                (state.vacancies?.requirements.toList() ?? []).length,
                                (index) {
                                  final List<RequirementsModel> list = state.vacancies?.requirements.toList() ?? [];
                                  final requirements = list[index];
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                                    width: 1.sw,
                                    decoration: BoxDecoration(
                                      color: colors.shade0,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Row(
                                      spacing: 6.w,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 46.h,
                                          width: 46.w,
                                          child: CommonImage(imageUrl: requirements.icon),
                                        ),
                                        Expanded(
                                          child: Text(
                                            requirements.title,
                                            style: fonts.smallText,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              20.h.verticalSpace,
                            ],
                          ),
                        ),
                        ResumeFilling(
                          bloc: context.read<VacancyBloc>(),
                          jobId: -1,
                          compId: -1,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
