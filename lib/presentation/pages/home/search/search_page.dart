import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/search/search_bloc.dart';
import 'package:medion/domain/models/search/search_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/home/search/component/no_search_found.dart';
import 'package:medion/presentation/pages/home/search/component/searching_design_lottie.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      final text = _searchController.text.trim();

      if (text.length >= 3) {
        if (!_hasSearched) {
          setState(() => _hasSearched = true);
        }
        context.read<SearchBloc>().add(
              SearchEvent.searchData(SearchReqModel((b) => b..text = text)),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              isBack: true,
              titleWidget: CustomTextField(
                controller: _searchController,
                cursorColor: colors.error500,
                hintText: "search".tr(),
                suffixIcon: icons.cancel.svg(
                  color: colors.primary900,
                  width: 16.w,
                  height: 16.h,
                ),
                prefixIcon: icons.search.svg(color: colors.primary900),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (!_hasSearched) {
                    return const SearchingDesignLottie();
                  }

                  if (state.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.error500,
                      ),
                    );
                  }

                  if (state.error) {
                    return const NoSearchFound();
                  }

                  if (state.success && state.results.isNotEmpty) {
                    final results = state.results.first;

                    final hasDoctors = results.doctors.isNotEmpty;
                    final hasServices = results.categories.isNotEmpty;
                    final hasArticles = results.articles.isNotEmpty;

                    if (!hasDoctors && !hasServices && !hasArticles) {
                      return const NoSearchFound();
                    }

                    return ListView(
                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                      children: [
                        if (hasDoctors) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                            child: Text(
                              "doctors".tr(),
                              style: fonts.regularMain.copyWith(fontSize: 18.sp),
                            ),
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: results.doctors.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 8.h,
                              childAspectRatio: 0.50,
                            ),
                            itemBuilder: (context, index) {
                              final doctor = results.doctors[index];
                              return DoctorsItem(
                                academicRank: "",
                                home: true,
                                categoryType: "",
                                candidateScience: false,
                                isInnerPageUsed: true,
                                onTap: () {
                                  context.read<BottomNavBarController>().changeNavBar(true);

                                  Navigator.push(
                                    context,
                                    AppRoutes.getAboutDoctorPage(
                                      name: doctor.name.toString(),
                                      profession: doctor.job.toString(),
                                      status: "",
                                      image: doctor.image.toString(),
                                      id: doctor.id ?? 32,
                                    ),
                                  ).then((_) {
                                    context.read<BottomNavBarController>().changeNavBar(false);
                                  });
                                },
                                doctorID: doctor.id ?? 0,
                                name: doctor.name,
                                imagePath: doctor.image,
                                profession: doctor.job,
                              );
                            },
                          ),
                        ],
                        if (hasServices) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                            child: Text(
                              "services".tr(),
                              style: fonts.regularMain.copyWith(fontSize: 18.sp),
                            ),
                          ),
                          // ...List.generate(results.categories.length, (index) {
                          //
                          //   return Container(
                          //     padding: EdgeInsets.symmetric(vertical: 6.h),
                          //     decoration: BoxDecoration(
                          //       color: colors.shade0,
                          //       borderRadius: BorderRadius.only(
                          //           topLeft: Radius.circular(8.r),
                          //           topRight: Radius.circular(8.r)),
                          //       border: Border(
                          //         bottom: BorderSide(
                          //           color: colors.neutral400,
                          //           width: 1,
                          //         ),
                          //       ),
                          //     ),
                          //     child: AnimationButtonEffect(
                          //       onTap: () {
                          //         print("SELECTED IF ${service.id}");
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) =>
                          //                     BookingSecondPage(
                          //                       isUSD: false,
                          //                       serviceId: service.id!,
                          //                     )));
                          //       },
                          //       child: HomeListTile(
                          //         trailing: icons.right.svg(),
                          //         title: service.name ?? "",
                          //         img: service.icon,
                          //       ),
                          //     ),
                          //   );
                          // }),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: results.categories.length,
                            itemBuilder: (context, index) {
                              final service = results.categories[index];

                              return MedicalDirectionItem(
                                onTap: () {
                                  context.read<BottomNavBarController>().changeNavBar(true);
                                  Navigator.push(
                                    context,
                                    AppRoutes.getDirectionInfoPage(id: service.id!, name: service.name ?? ""),
                                  ).then((_) {
                                    context.read<BottomNavBarController>().changeNavBar(false);
                                  });
                                },
                                title: service.name ?? "",
                                subtitle: "",
                                iconPath: service.icon ?? "",
                              );
                            },
                          ),
                          80.h.verticalSpace,
                        ],
                        if (hasArticles) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                            child: Text(
                              "Articles",
                              style: fonts.regularLink.copyWith(fontSize: 18.sp),
                            ),
                          ),
                          ...results.articles.map(
                            (article) => ListTile(
                              title: Text(article.name ?? "Untitled Article"),
                              subtitle: Text(article.description ?? "No Summary"),
                            ),
                          ),
                          const Divider(),
                        ],
                      ],
                    );
                  }

                  return const NoSearchFound();
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
