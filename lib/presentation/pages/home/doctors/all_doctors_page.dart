import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/sources/category.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_filter_bottomsheet.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctor_search_page.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AllDoctorsPage extends StatefulWidget {
  const AllDoctorsPage({super.key});

  @override
  State<AllDoctorsPage> createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  bool isMedionDoctor = true;
  Category selectedCategory = Category.all;
  bool isSearchActive = false;
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> recentSearches = [];
  FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(const DoctorEvent.fetchDoctors());
    _searchFocusNode.addListener(_handleSearchFocusChange);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.removeListener(_handleSearchFocusChange);
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _handleSearchFocusChange() {
    setState(() {
      isSearchActive = _searchFocusNode.hasFocus || searchQuery.isNotEmpty;
    });
  }

  void _clearSearch() {
    setState(() {
      searchQuery = '';
      _searchController.clear();
      isSearchActive = false;
    });
    _searchFocusNode.unfocus();
  }

  void _addToRecentSearches(String query) {
    if (query.trim().isNotEmpty &&
        !recentSearches.any((item) => item['query'] == query)) {
      setState(() {
        recentSearches.insert(0, {
          'query': query,
          'time': DateTime.now(),
        });

        if (recentSearches.length > 5) {
          recentSearches = recentSearches.sublist(0, 5);
        }
      });
    }
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
                title: "\t\t\t\t\t\t\t\t\t ${"doctors".tr()}",
                isBack: true,
                hasToggle: true,
                centerTitle: true,
                toggleFirstText: "doctors_of_medion".tr(),
                toggleSecondText: "foreign_doctors".tr(),
                trailing: Row(
                  children: [
                    24.w.horizontalSpace,
                    AnimationButtonEffect(
                      onTap: () async {
                        final result = await showModalBottomSheet<Category>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: colors.shade0,
                          builder: (context) => const CFilterBottomsheet(),
                        );
                        if (result != null) {
                          setState(() {
                            selectedCategory = result;
                          });
                        }
                      },
                      child: icons.filter.svg(width: 24.w, height: 24.h),
                    ),
                  ],
                ),
                bottom: Column(
                  children: [
                    CustomToggle(
                      iconList: [
                        Text(
                          'doctors_of_medion'.tr(),
                          style: fonts.xSmallLink.copyWith(
                            color: isMedionDoctor
                                ? colors.shade0
                                : colors.primary900,
                          ),
                        ),
                        Text(
                          'foreign_doctors'.tr(),
                          style: fonts.xSmallLink.copyWith(
                            color: !isMedionDoctor
                                ? colors.shade0
                                : colors.primary900,
                          ),
                        ),
                      ],
                      onChanged: (value) =>
                          setState(() => isMedionDoctor = value),
                      current: isMedionDoctor,
                      values: const [true, false],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              focusNode: _searchFocusNode,
                              prefixIcon: SvgPicture.asset(
                                  "assets/icons/search.svg",
                                  color: colors.neutral500),
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value.toLowerCase();
                                  isSearchActive = value.isNotEmpty ||
                                      _searchFocusNode.hasFocus;
                                });
                              },
                              // onSubmitted: (value) {
                              //   if (value.isNotEmpty) {
                              //     _addToRecentSearches(value);
                              //   }
                              // },
                              // onTap: () {
                              //   setState(() {
                              //     isSearchActive = true;
                              //   });
                              // },
                              hintText: 'search_doctors'.tr(),
                            ),
                          ),
                          if (searchQuery.isNotEmpty) ...[
                            8.w.horizontalSpace,
                            AnimationButtonEffect(
                              onTap: _clearSearch,
                              child: Icon(
                                Icons.close,
                                size: 24.w,
                                color: colors.neutral600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    if (state.error) {
                      return Center(
                          child: Text('something_went_wrong'.tr(),
                              style: fonts.regularSemLink));
                    }

                    if (isSearchActive) {
                      return _buildSearchResults(state, colors, fonts, icons);
                    }

                    return _buildDefaultView(state, colors, fonts, icons);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchResults(DoctorState state, colors, fonts, icons) {
    // Get all doctors flattened
    final allDoctors = state.doctors.expand((category) {
      return category.doctorData.map((doctor) {
        return {
          'name': doctor.name.toString(),
          'profession': doctor.specialty?.value.toString() ?? 'N/A',
          'image': doctor.image?.value.toString() ?? '',
          'category': category.categoryName.toString(),
          'id': doctor.id.toString(),
          'status': doctor.academicRank?.toString() ?? 'N/A',
          'candidateScience': false,
        };
      });
    }).toList();

    // Filter doctors based on search query
    final searchResults = searchQuery.isEmpty
        ? []
        : allDoctors.where((doctor) {
            final name = doctor['name']?.toString().toLowerCase() ?? '';
            final profession =
                doctor['profession']?.toString().toLowerCase() ?? '';
            final category = doctor['category']?.toString().toLowerCase() ?? '';

            return name.contains(searchQuery) ||
                profession.contains(searchQuery) ||
                category.contains(searchQuery);
          }).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          if (searchQuery.isEmpty && recentSearches.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "recently_searchs".tr(),
                  style: fonts.regularMain
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                AnimationButtonEffect(
                  onTap: () {
                    setState(() {
                      recentSearches = [];
                    });
                  },
                  child: Text(
                    "clear".tr(),
                    style: fonts.regularMain.copyWith(
                        fontSize: 14.sp,
                        color: colors.neutral600,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            12.h.verticalSpace,
            SizedBox(
              height: 60.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  final search = recentSearches[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: AnimationButtonEffect(
                      onTap: () {
                        setState(() {
                          searchQuery = search['query'];
                          _searchController.text = search['query'];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.shade100,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            icons.clock.svg(
                              width: 16.w,
                              height: 16.h,
                              color: colors.neutral600,
                            ),
                            8.w.horizontalSpace,
                            Text(
                              search['query'],
                              style: fonts.regularMain.copyWith(
                                fontSize: 14.sp,
                                color: colors.neutral600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            16.h.verticalSpace,
          ],
          if (searchQuery.isNotEmpty && searchResults.isEmpty) ...[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/emoji-sad_d.svg",
                        width: 80.w, height: 80.h),
                    16.h.verticalSpace,
                    Text(
                      "no_results_found".tr(),
                      style: fonts.mediumMain
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.h.verticalSpace,
                    Text(
                      "try_different_search".tr(),
                      style:
                          fonts.regularMain.copyWith(color: colors.neutral600),
                    ),
                  ],
                ),
              ),
            ),
          ] else if (searchQuery.isNotEmpty) ...[
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: searchResults.length,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 0.51,
                ),
                itemBuilder: (context, index) {
                  final doctor = searchResults[index];
                  return DoctorsItem(
                    home: false,
                    isInnerPageUsed: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        AppRoutes.getAboutDoctorPage(
                          doctor['name'].toString(),
                          doctor['profession'],
                          doctor['name'].toString(),
                          doctor['image'].toString(),
                          doctor['id'],
                        ),
                      ).then((_) {
                        context
                            .read<BottomNavBarController>()
                            .changeNavBar(true);
                      });
                    },
                    categoryType: doctor['category'],
                    imagePath: doctor['image'].toString(),
                    name: doctor['name'].toString(),
                    profession: doctor['profession'].toString(),
                    status: doctor['status']?.toString() ?? 'N/A',
                    candidateScience: false,
                    doctorID: int.parse(doctor['id']),
                  );
                },
              ),
            ),
          ] else ...[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: colors.neutral500,
                      width: 80.w,
                      height: 80.h,
                    ),
                    16.h.verticalSpace,
                    Text(
                      "search_for_doctors".tr(),
                      style: fonts.mediumMain
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.h.verticalSpace,
                    Text(
                      "search_by_name_or_specialty".tr(),
                      style:
                          fonts.regularMain.copyWith(color: colors.neutral600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDefaultView(DoctorState state, colors, fonts, icons) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMedionDoctor) ...[
            ...state.doctors.map((category) {
              var filteredDoctors = category.doctorData
                  .where((doctor) => _matchesCategory(doctor))
                  .map((doctor) => {
                        'name': doctor.name.toString(),
                        'profession':
                            doctor.specialty?.value.toString() ?? 'N/A',
                        'image': doctor.image?.value.toString() ?? '',
                        'category': category.categoryName.toString(),
                        'id': doctor.id.toString(),
                        'status': doctor.academicRank?.toString() ?? 'N/A',
                        'candidateScience': false
                      })
                  .toList();

              if (filteredDoctors.isEmpty && selectedCategory != Category.all) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/emoji-sad_d.svg",
                          width: 80.w, height: 80.h),
                      Center(
                        child: Text(
                          "no_result_found".tr(),
                          style: fonts.mediumMain
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return _buildDoctorCategoryList(
                  category.categoryName, filteredDoctors, colors, fonts, icons);
            }),
          ] else ...[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/emoji-sad_d.svg",
                      width: 80.w, height: 80.h),
                  Center(
                    child: Text(
                      "no_result_found".tr(),
                      style: fonts.mediumMain
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool _matchesCategory(DoctorData doctor) {
    if (selectedCategory == Category.all) return true;

    final specialtyValue = doctor.specialty?.value;
    final specialty = specialtyValue is String
        ? specialtyValue.toLowerCase()
        : specialtyValue == null || specialtyValue == false
            ? ''
            : specialtyValue.toString().toLowerCase();

    switch (selectedCategory) {
      case Category.gynecology:
        return specialty.contains('гинеколог');
      case Category.cardiology:
        return specialty.contains('кардиолог') ||
            specialty.contains('кардиохирург') ||
            specialty.contains('интервенционный кардиолог');
      case Category.ophthalmology:
        return specialty.contains('офтальмолог');
      case Category.neurology:
        return specialty.contains('невролог');
      case Category.pediatric:
        return specialty.contains('педиатр') || specialty.contains('детский');
      case Category.all:
        return true;
      default:
        return false;
    }
  }

  Widget _buildDoctorCategoryList(String category,
      List<Map<String, dynamic>> doctors, colors, fonts, icons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: fonts.regularSemLink),
        12.h.verticalSpace,
        GridView.builder(
          shrinkWrap: true,
          itemCount: doctors.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.51,
          ),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return DoctorsItem(
                home: false,
                isInnerPageUsed: true,
                onTap: () {
                  Navigator.push(
                          context,
                          AppRoutes.getAboutDoctorPage(
                              doctor['name'].toString(),
                              doctor['profession'],
                              doctor['name'].toString(),
                              doctor['image'].toString(),
                              int.parse(doctor['id'])))
                      .then((_) {
                    context.read<BottomNavBarController>().changeNavBar(true);
                  });
                },
                categoryType: doctor['category'].toString(),
                imagePath: doctor['image'].toString(),
                name: doctor['name'].toString(),
                profession: doctor['profession'].toString(),
                status: doctor['status']?.toString() ?? 'N/A',
                candidateScience: false,
                doctorID: int.parse(doctor['id']));
          },
        ),
        16.h.verticalSpace,
      ],
    );
  }
}
