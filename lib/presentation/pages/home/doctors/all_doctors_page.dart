import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_filter_bottomsheet.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctor_search_page.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

enum Category {
  all,
  allergistImmunologist,
  andrologist,
  anesthesiologistResuscitator,
  ultrasoundSpecialist,
  gastroenterologist,
  gynecologist,
  dermatovenereologist,
  pediatricNeurologist,
  pediatricTherapistDentist,
  cardiologist,
  cardiacSurgeon,
  mammologist,
  neurologist,
  neurosurgeon,
  oncologist,
  oncosurgeon,
  orthopedist,
  otorhinolaryngologist,
  ophthalmologist,
  pediatrician,
  plasticSurgeon,
  pulmonologist,
  rheumatologist,
  vascularSurgeon,
  surdologistOtorhinolaryngologist,
  therapist,
  therapistDentist,
  traumatologist,
  urologist,
  endocrinologist,
}

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
  final FocusNode _searchFocusNode = FocusNode();

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
    if (query.trim().isNotEmpty && !recentSearches.any((item) => item['query'] == query)) {
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
                child: icons.filter.svg(width: 20.w, height: 20.h),
              ),
              const SizedBox(width: 10),
              AnimationButtonEffect(
                onTap: () => Navigator.push(context, AppRoutes.getSearchPage()),
                child: icons.search.svg(color: colors.primary900, width: 20.w, height: 20.h),
              ),
              const SizedBox(width: 10)
            ],
          ),
          body: BlocBuilder<DoctorBloc, DoctorState>(
            builder: (context, state) {
              if (state.loading || state.doctors == null) {
                return _buildShimmerView(colors);
              }
              if (state.error) {
                return Center(child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink));
              }
              if (isSearchActive) {
                return _buildSearchResults(state, colors, fonts, icons);
              }
              return _buildDefaultView(state, colors, fonts, icons);
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

  Widget _buildSearchResults(DoctorState state, colors, fonts, icons) {
    final allDoctors = (state.doctors?.doctorData?.toList() ?? []).map((doctor) {
      return {
        'name': doctor.name.toString(),
        'profession': doctor.specialty?.toString() ?? 'N/A',
        'image': doctor.image?.toString() ?? '',
        'id': doctor.id.toString(),
        'status': doctor.specialty?.toString() ?? 'N/A',
        'candidateScience': false,
        'work_experience': doctor.workExperience,
        'academic_rank': doctor.academicRank,
      };
    }).toList();

    final searchResults = searchQuery.isEmpty
        ? []
        : allDoctors.where((doctor) {
            final name = doctor['name']?.toString().toLowerCase() ?? '';
            final profession = doctor['profession']?.toString().toLowerCase() ?? '';
            return name.contains(searchQuery) || profession.contains(searchQuery);
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
                  style: fonts.regularMain.copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                AnimationButtonEffect(
                  onTap: () {
                    setState(() {
                      recentSearches = [];
                    });
                  },
                  child: Text(
                    "clear".tr(),
                    style: fonts.regularMain
                        .copyWith(fontSize: 14.sp, color: colors.neutral600, fontWeight: FontWeight.w400),
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
                    SvgPicture.asset("assets/icons/emoji-sad_d.svg", width: 80.w, height: 80.h),
                    16.h.verticalSpace,
                    Text(
                      "no_results_found".tr(),
                      style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.h.verticalSpace,
                    Text(
                      "try_different_search".tr(),
                      style: fonts.regularMain.copyWith(color: colors.neutral600),
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
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  final doctor = searchResults[index];
                  return ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.2),
                    child: DoctorsItem(
                      academicRank: doctor["academic_rank"].toString(),
                      home: false,
                      isInnerPageUsed: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          AppRoutes.getAboutDoctorPage(
                            name: doctor['name'].toString(),
                            profession: doctor['profession'],
                            status: doctor['name'].toString(),
                            image: doctor['image'].toString(),
                            id: doctor['id'],
                          ),
                        ).then((_) {
                          context.read<BottomNavBarController>().changeNavBar(true);
                        });
                      },
                      categoryType: doctor['category'],
                      imagePath: doctor['image'].toString(),
                      name: doctor['name'].toString(),
                      profession: doctor['profession'].toString(),
                      status: doctor['status']?.toString() ?? 'N/A',
                      candidateScience: false,
                      doctorID: int.parse(doctor['id']),
                    ),
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
                      style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.h.verticalSpace,
                    Text(
                      "search_by_name_or_specialty".tr(),
                      style: fonts.regularMain.copyWith(color: colors.neutral600),
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

  Widget _buildDefaultView(state, colors, fonts, icons) {
    // Handle null or empty doctorData
    final doctorData = state.doctors?.doctorData ?? [];
    if (doctorData.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/emoji-sad_d.svg",
              width: 80.w,
              height: 80.h,
            ),
            Center(
              child: Text(
                "no_doctors_available".tr(),
                style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    final filteredDoctors = doctorData
        .where((doctor) => _matchesCategory(doctor))
        .map((doctor) => {
              'name': doctor.name.toString(),
              'profession': doctor.specialty?.toString() ?? 'N/A',
              'image': doctor.image?.toString() ?? '',
              'id': doctor.id.toString(),
              'status': doctor.specialty?.toString() ?? 'N/A',
              'candidateScience': false,
              'work_experience': doctor.workExperience,
              'academic_rank': doctor.academicRank,
            })
        .toList();

    if (filteredDoctors.isEmpty && selectedCategory != Category.all) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/emoji-sad_d.svg",
              width: 80.w,
              height: 80.h,
            ),
            Center(
              child: Text(
                "no_result_found".tr(),
                style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    if (!isMedionDoctor) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/emoji-sad_d.svg",
              width: 80.w,
              height: 80.h,
            ),
            Center(
              child: Text(
                "no_result_found".tr(),
                style: fonts.mediumMain.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    // Calculate the number of doctors needed to fill the last row
    const int crossAxisCount = 2;
    int remainder = filteredDoctors.length % crossAxisCount;
    List<Map<String, dynamic>> allDoctors = List.from(filteredDoctors);

    if (remainder != 0) {
      int doctorsToAdd = crossAxisCount - remainder;
      for (int i = 0; i < doctorsToAdd; i++) {
        allDoctors.add({
          'name': 'Placeholder Doctor',
          'profession': 'N/A',
          'image': '',
          'id': 'placeholder_${i + allDoctors.length}',
          'status': 'N/A',
          'candidateScience': false,
          'work_experience': 0,
          'academic_rank': "Профессор",
        });
      }
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
            itemCount: allDoctors.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.50,
            ),
            itemBuilder: (context, index) {
              final doctor = allDoctors[index];
              if (doctor['name'] == 'Placeholder Doctor') {
                return DoctorsItem(
                  academicRank: doctor["academic_rank"].toString(),
                  home: false,
                  isInnerPageUsed: true,
                  onTap: () {},
                  experience: "experience".tr(namedArgs: {"count": "0"}),
                  categoryType: '',
                  imagePath: '',
                  name: 'N/A',
                  profession: 'N/A',
                  status: 'N/A',
                  candidateScience: false,
                  doctorID: int.parse(doctor['id'].toString().split('_').last),
                );
              }
              return DoctorsItem(
                academicRank: doctor["academic_rank"].toString(),
                home: false,
                isInnerPageUsed: true,
                onTap: () {
                  Navigator.push(
                    context,
                    AppRoutes.getAboutDoctorPage(
                      name: doctor['name'].toString(),
                      profession: doctor['profession'],
                      status: doctor['name'].toString(),
                      image: doctor['image'].toString(),
                      id: int.parse(doctor['id']),
                    ),
                  ).then((_) {
                    context.read<BottomNavBarController>().changeNavBar(true);
                  });
                },
                experience: "experience".tr(namedArgs: {"count": doctor['work_experience'].toString()}),
                categoryType: '',
                imagePath: doctor['image'].toString(),
                name: doctor['name'].toString(),
                profession: doctor['profession'].toString(),
                status: doctor['status']?.toString() ?? 'N/A',
                candidateScience: false,
                doctorID: int.parse(doctor['id']),
              );
            },
          ),
          16.h.verticalSpace,
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
      case Category.allergistImmunologist:
        return specialty.contains('аллерголог-иммунолог');
      case Category.andrologist:
        return specialty.contains('андролог');
      case Category.anesthesiologistResuscitator:
        return specialty.contains('анестезиолог-реаниматолог');
      case Category.ultrasoundSpecialist:
        return specialty.contains('врач узи');
      case Category.gastroenterologist:
        return specialty.contains('гастроэнтеролог');
      case Category.gynecologist:
        return specialty.contains('гинеколог');
      case Category.dermatovenereologist:
        return specialty.contains('дерматовенеролог');
      case Category.pediatricNeurologist:
        return specialty.contains('детский невролог');
      case Category.pediatricTherapistDentist:
        return specialty.contains('детский терапевт-стоматолог');
      case Category.cardiologist:
        return specialty.contains('кардиолог');
      case Category.cardiacSurgeon:
        return specialty.contains('кардиохирург');
      case Category.mammologist:
        return specialty.contains('маммолог');
      case Category.neurologist:
        return specialty.contains('невролог');
      case Category.neurosurgeon:
        return specialty.contains('нейрохирург');
      case Category.oncologist:
        return specialty.contains('онколог');
      case Category.oncosurgeon:
        return specialty.contains('онкохирург');
      case Category.orthopedist:
        return specialty.contains('ортопед');
      case Category.otorhinolaryngologist:
        return specialty.contains('оториноларинголог');
      case Category.ophthalmologist:
        return specialty.contains('офтальмолог');
      case Category.pediatrician:
        return specialty.contains('педиатр');
      case Category.plasticSurgeon:
        return specialty.contains('пластический хирург');
      case Category.pulmonologist:
        return specialty.contains('пульмонолог');
      case Category.rheumatologist:
        return specialty.contains('ревматолог');
      case Category.vascularSurgeon:
        return specialty.contains('сосудистый хирург');
      case Category.surdologistOtorhinolaryngologist:
        return specialty.contains('сурдолог-оториноларинголог');
      case Category.therapist:
        return specialty.contains('терапевт') && !specialty.contains('стоматолог');
      case Category.therapistDentist:
        return specialty.contains('терапевт стоматолог');
      case Category.traumatologist:
        return specialty.contains('травматолог');
      case Category.urologist:
        return specialty.contains('уролог');
      case Category.endocrinologist:
        return specialty.contains('эндокринолог');
      case Category.all:
        return true;
      default:
        return false;
    }
  }
}
