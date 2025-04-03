import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [
    'Дерматологи',
    'Неврологи',
    'Репродуктологи'
  ];
  List<DoctorData> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults.clear();
      });
    } else {
      _performSearch(_searchController.text);
    }
  }

  void _performSearch(String query) {
    final doctorsBloc = context.read<DoctorBloc>();
    final state = doctorsBloc.state;

    if (state.doctors.isEmpty) return;

    setState(() {
      _isSearching = true;
      _searchResults.clear();
    });

    // Search through all doctors
    final results = <DoctorData>[];
    for (final category in state.doctors) {
      for (final doctor in category.doctorData) {
        if (_matchesSearchQuery(doctor, query)) {
          results.add(doctor);
        }
      }
    }

    setState(() {
      _searchResults = results;
    });
  }

  bool _matchesSearchQuery(DoctorData doctor, String query) {
    final name = doctor.name?.toString().toLowerCase() ?? '';
    final specialty = doctor.specialty?.value.toString().toLowerCase() ?? '';
    final queryLower = query.toLowerCase();

    return name.contains(queryLower) || specialty.contains(queryLower);
  }

  void _addToRecentSearches(String query) {
    if (!_recentSearches.contains(query)) {
      setState(() {
        _recentSearches.insert(0, query);
        if (_recentSearches.length > 5) {
          _recentSearches.removeLast();
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
                title: "search".tr(),
                isBack: true,
                centerTitle: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: icons.search.svg(width: 24.w, height: 24.h),
                    hintText: 'search_doctors'.tr(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: colors.shade100,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      _addToRecentSearches(value);
                    }
                  },
                ),
              ),
              Expanded(
                child: _isSearching
                    ? _buildSearchResults()
                    : _buildRecentSearches(),
              ),
              _buildKeyboard(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecentSearches() {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                'recent_searches'.tr(),
                style: fonts.mediumMain.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: _recentSearches.length,
                itemBuilder: (context, index) {
                  return AnimationButtonEffect(
                    onTap: () {
                      _searchController.text = _recentSearches[index];
                      _addToRecentSearches(_recentSearches[index]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        _recentSearches[index],
                        style: fonts.regularMain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        if (_searchResults.isEmpty) {
          return Center(
            child: Text(
              'no_results_found'.tr(),
              style: fonts.regularMain,
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            final doctor = _searchResults[index];
            return DoctorSearchItem(
              name: doctor.name?.toString() ?? 'N/A',
              specialty: doctor.specialty?.value.toString() ?? 'N/A',
              experience: doctor.workExperience?.toString() ?? '',
              onTap: () {
                // Navigate to doctor details
              },
            );
          },
        );
      },
    );
  }

  Widget _buildKeyboard() {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          color: colors.shade100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']
                    .map((key) => _buildKey(key))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']
                    .map((key) => _buildKey(key))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['Z', 'X', 'C', 'V', 'B', 'N', 'M']
                    .map((key) => _buildKey(key))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSpecialKey('123'),
                  _buildSpecialKey('space'),
                  _buildSpecialKey('return'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKey(String key) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: () {
            _searchController.text += key.toLowerCase();
          },
          child: Container(
            margin: EdgeInsets.all(2.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              key,
              style: fonts.regularMain,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpecialKey(String key) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: () {
            if (key == 'space') {
              _searchController.text += ' ';
            } else if (key == 'return') {
              if (_searchController.text.isNotEmpty) {
                _addToRecentSearches(_searchController.text);
              }
            }
          },
          child: Container(
            margin: EdgeInsets.all(2.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              key.tr(),
              style: fonts.regularMain,
            ),
          ),
        );
      },
    );
  }
}

class DoctorSearchItem extends StatelessWidget {
  final String name;
  final String specialty;
  final String experience;
  final VoidCallback onTap;

  const DoctorSearchItem({
    super.key,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: colors.shade100,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: fonts.mediumMain.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.h.verticalSpace,
                Text(
                  specialty,
                  style: fonts.smallMain,
                ),
                if (experience.isNotEmpty) ...[
                  4.h.verticalSpace,
                  Text(
                    'experience_years'.tr(args: [experience]),
                    style: fonts.smallMain.copyWith(
                      color: colors.primary500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
