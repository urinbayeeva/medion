import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class VacancyDetailPage extends StatefulWidget {
  final int vacancyId;

  const VacancyDetailPage({super.key, required this.vacancyId});

  @override
  State<VacancyDetailPage> createState() => _VacancyDetailPageState();
}

class _VacancyDetailPageState extends State<VacancyDetailPage> {
  Map<String, dynamic>? _vacancy;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchVacancy();
  }

  Future<void> _fetchVacancy() async {
    try {
      final uri = Uri.parse(
          'https://his.uicgroup.tech/apiweb/recruitment/vacancies?vacancy_id=${widget.vacancyId}&lang=en_US');
      final response = await http.get(uri);
      print('API Response: ${response.body}'); // Debug API response

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _vacancy = jsonData;
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data: Status ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching vacancy: $e');
      setState(() {
        _errorMessage = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  String _stripHtmlTags(String htmlString) {
    return htmlString.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  Widget _buildSectionContent(String title, String content, colors, fonts) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: colors.shade0,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fonts.regularMain.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.h, right: 8.w),
                child: Text('•',
                    style:
                        fonts.regularMain.copyWith(color: colors.neutral700)),
              ),
              Expanded(
                child: Text(
                  content,
                  style: fonts.regularMain.copyWith(color: colors.neutral700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(color: colors.error500),
                )
              : _errorMessage != null
                  ? Center(child: Text(_errorMessage!))
                  : _vacancy == null
                      ? Center(child: Text('No data available'))
                      : Column(
                          children: [
                            CAppBar(
                                title: "career".tr(),
                                centerTitle: true,
                                isBack: true,
                                trailing: 24.w.horizontalSpace,
                                bottom: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      14.h.verticalSpace,
                                      Text(
                                        _vacancy!['name'] ?? 'Unnamed Vacancy',
                                        style: fonts.mediumMain,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Salary: ${_vacancy!['salary']} ${_vacancy!['currency']}',
                                            style: fonts.regularMain.copyWith(
                                                color: colors.neutral700),
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            'Type: ${_vacancy!['work_type']}',
                                            style: fonts.regularMain.copyWith(
                                                color: colors.neutral700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'Required Experience: ${_vacancy!['required_experience_year']} years',
                                        style: fonts.regularMain
                                            .copyWith(color: colors.neutral700),
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.all(16.w),
                                children: [
                                  SizedBox(height: 16.h),
                                  _buildSectionContent(
                                    'Responsibilities'.tr(),
                                    _stripHtmlTags(
                                        _vacancy!['responsibilities'] ?? ''),
                                    colors,
                                    fonts,
                                  ),
                                  SizedBox(height: 16.h),
                                  _buildSectionContent(
                                    'Requirements'.tr(),
                                    _stripHtmlTags(
                                        _vacancy!['requirements'] ?? ''),
                                    colors,
                                    fonts,
                                  ),
                                  SizedBox(height: 16.h),
                                  _buildSectionContent(
                                    'Our Offer'.tr(),
                                    _stripHtmlTags(
                                        _vacancy!['our_offer'] ?? ''),
                                    colors,
                                    fonts,
                                  ),
                                  SizedBox(height: 16.h),
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: colors.shade0,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Skills'.tr(),
                                          style: fonts.regularMain.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 8.h),
                                        Wrap(
                                          spacing: 8.w,
                                          children: (_vacancy!['skills']
                                                      as List<dynamic>?)
                                                  ?.map((skill) => Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 4.h,
                                                                    right: 8.w),
                                                            child: Text('•',
                                                                style: fonts
                                                                    .regularMain
                                                                    .copyWith(
                                                                        color: colors
                                                                            .neutral700)),
                                                          ),
                                                          Chip(
                                                            label: Text(skill
                                                                .toString()),
                                                            backgroundColor:
                                                                colors.shade0,
                                                          ),
                                                        ],
                                                      ))
                                                  .toList() ??
                                              [const Text('No skills listed')],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Location'.tr(),
                                    style: fonts.regularMain
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    height: 200.h,
                                    color: colors.shade0,
                                    child: Center(
                                      child: Text(
                                        'Map Placeholder (Lat: ${_vacancy!['latitude']}, Long: ${_vacancy!['longitude']})',
                                        style: fonts.regularMain
                                            .copyWith(color: colors.neutral700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    'Contact Us'.tr(),
                                    style: fonts.regularMain
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,
                                          color: colors.neutral700),
                                      SizedBox(width: 8.w),
                                      Text(
                                        _vacancy!['phone'] ?? 'No phone',
                                        style: fonts.regularMain
                                            .copyWith(color: colors.neutral700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      Icon(Icons.email,
                                          color: colors.neutral700),
                                      SizedBox(width: 8.w),
                                      Text(
                                        _vacancy!['email'] ?? 'No email',
                                        style: fonts.regularMain
                                            .copyWith(color: colors.neutral700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add apply logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colors.error500,
                                      foregroundColor: colors.shade0,
                                    ),
                                    child: Text('Apply'.tr()),
                                  ),
                                  SizedBox(height: 28.h),
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
