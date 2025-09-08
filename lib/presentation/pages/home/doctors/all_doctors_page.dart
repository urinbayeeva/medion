import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_filter_bottomsheet.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/home_doctor_item.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AllDoctorsPage extends StatefulWidget {
  const AllDoctorsPage({super.key});

  @override
  State<AllDoctorsPage> createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  final ValueNotifier<String> _filterText = ValueNotifier("all");
  final ValueNotifier<String> _searchText = ValueNotifier("");
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
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
            title: Text("doctors".tr(), style: fonts.regularMain),
            actions: [
              // AnimationButtonEffect(
              //   onTap: () => Navigator.push(context, AppRoutes.getSearchPage()),
              //   child: icons.search.svg(color: colors.primary900, width: 20.w, height: 20.h),
              // ),
              12.w.horizontalSpace,
              AnimationButtonEffect(
                onTap: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: colors.transparent,
                    constraints: BoxConstraints(maxHeight: 0.7.sh),
                    builder: (ctx) {
                      final items = context.read<DoctorBloc>().state.doctorsFilterList;
                      return ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                        child: CFilterBottomsheet(
                          items: items,
                          selectedTitle: _filterText,
                        ),
                      );
                    },
                  );
                  if (result != null) {
                    _filterText.value = result;
                  }
                },
                child: icons.filter.svg(width: 20.w, height: 20.h),
              ),
              12.w.horizontalSpace,
            ],
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 70.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: CustomTextField(
                  cursorColor: colors.darkMode900,
                  padding: const EdgeInsets.only(bottom: 12),
                  onChanged: (v) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 600), () {
                      _searchText.value = v;
                    });
                  },
                  hintText: 'search'.tr(),
                ),
              ),
            ),
          ),
          body: BlocBuilder<DoctorBloc, DoctorState>(
            builder: (context, state) {
              if (state.fetchDoctors.isInitial || state.fetchDoctors.isInProgress) return _buildShimmerView(colors);

              final doctors = state.doctors?.doctorData?.toList() ?? [];
              if (state.fetchDoctors.isFailure || doctors.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }

              return ValueListenableBuilder(
                valueListenable: _searchText,
                builder: (context, searchTitle, child) {
                  return ValueListenableBuilder(
                    valueListenable: _filterText,
                    builder: (context, text, child) {
                      final filteredDoctors = <DoctorData>[
                        ...doctors.where((doctor) {
                          final filterQuery = text.toLowerCase();
                          final searchQuery = searchTitle.toLowerCase();

                          // 1) filter by specialty
                          final matchesFilter =
                              filterQuery == 'all' ? true : doctor.specialty.toString().toLowerCase() == filterQuery;

                          // 2) search by name or job/profession
                          final matchesSearch = searchQuery.isEmpty
                              ? true
                              : doctor.name.toString().toLowerCase().contains(searchQuery) ||
                                  doctor.specialty.toString().toLowerCase().contains(searchQuery);

                          return matchesFilter && matchesSearch;
                        })
                      ];

                      if (filteredDoctors.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 130.h),
                            child: EmptyState(title: "no_results_found".tr()),
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            12.h.verticalSpace,
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: filteredDoctors.length,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 0.6.sw,
                                mainAxisSpacing: 10.h,
                                crossAxisSpacing: 6.w,
                                mainAxisExtent: 335.h,
                              ),
                              itemBuilder: (context, index) {
                                final doctor = filteredDoctors[index];

                                if (doctor.name.toString().toLowerCase().contains("placeholder")) {
                                  return HomeDoctorItem(
                                    onTap: () {},
                                    doctorID: -1,
                                    hasDiscount: false,
                                    experience: "0",
                                    name: "N/A",
                                    categoryType: "N/A",
                                    academicRank: doctor.academicRank.toString(),
                                    infoDescription: "N/A",
                                    profession: "N/A",
                                    imagePath: "",
                                    gender: "N/A",
                                  );
                                }

                                final status = MyFunctions.decodedText(doctor.specialty.toString());

                                return HomeDoctorItem(
                                  doctorID: doctor.id!,
                                  hasDiscount: doctor.hasDiscount ?? false,
                                  experience: (doctor.workExperience ?? "").toString(),
                                  name: (doctor.name ?? "").toString(),
                                  categoryType: status.isEmpty ? status : 'N/A',
                                  academicRank: (doctor.academicRank ?? '').toString(),
                                  infoDescription: (doctor.specialty ?? "").toString(),
                                  profession: (doctor.specialty ?? "").toString(),
                                  imagePath: (doctor.image ?? "").toString(),
                                  gender: "N/A",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      AppRoutes.getAboutDoctorPage(
                                        name: (doctor.name).toString(),
                                        profession: (doctor.specialty ?? "").toString(),
                                        status: status,
                                        image: (doctor.image ?? "").toString(),
                                        id: doctor.id!,
                                      ),
                                    ).then((_) {
                                      context.read<BottomNavBarController>().changeNavBar(true);
                                    });
                                  },
                                );
                              },
                            ),
                            16.h.verticalSpace,
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildShimmerView(dynamic colors) {
    return ShimmerView(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            3,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.h.verticalSpace,
                ShimmerContainer(
                  width: 100.w,
                  height: 20.h,
                  borderRadius: 4.r,
                  margin: EdgeInsets.only(bottom: 12.h),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: 4,
                  itemBuilder: (_, __) => ShimmerContainer(height: 200.h, borderRadius: 8.r),
                ),
                16.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
