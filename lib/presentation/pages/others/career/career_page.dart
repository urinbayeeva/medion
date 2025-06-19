import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/component/resume_container.dart';
import 'package:medion/presentation/pages/others/career/career_inside.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/presentation/pages/others/career/widgets/why_us_widget.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  List<Map<String, String>> _requirements = [];
  List<Map<String, String>> _medicineVacancies = [];
  List<Map<String, String>> _officeVacancies = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchRequirements();
  }

  Future<void> _fetchRequirements() async {
    try {
      final uri = Uri.parse(
          'https://his.uicgroup.tech/apiweb/recruitment/vacancies?lang=en_US');
      final response = await http.get(uri);
      print('API Response: ${response.body}'); // Debug API response

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print('Parsed JSON: $jsonData'); // Debug parsed JSON

        final List requirements = jsonData['requirements'] ?? [];
        final List medicineVacancies = jsonData['medicine_vacancies'] ?? [];
        final List officeVacancies = jsonData['office_vacancies'] ?? [];

        setState(() {
          _requirements = requirements
              .map<Map<String, String>>((req) => {
                    'title': req['title']?.toString() ?? '',
                    'icon': req['icon']?.toString() ?? '',
                  })
              .toList();

          _medicineVacancies = medicineVacancies
              .map<Map<String, String>>((vac) => {
                    'name': vac['name']?.toString() ?? '',
                    'description': vac['description']?.toString() ?? '',
                  })
              .toList();

          _officeVacancies = officeVacancies
              .map<Map<String, String>>((vac) => {
                    'name': vac['name']?.toString() ?? '',
                    'description': vac['description']?.toString() ?? '',
                  })
              .toList();

          print(
              'Medicine Vacancies: $_medicineVacancies'); // Debug medicine vacancies
          print(
              'Office Vacancies: $_officeVacancies'); // Debug office vacancies
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data: Status ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching requirements: $e');
      setState(() {
        _errorMessage = 'Error: $e';
        _isLoading = false;
      });
    }
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
              children: [
                CAppBar(
                  bordered: true,
                  title: 'career'.tr(),
                  centerTitle: true,
                  isBack: true,
                  trailing: SizedBox(width: 24.w),
                  bottom: CustomTabbarBlack(
                    tabs: ['Медицина'.tr(), 'Офис'.tr()],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Medicine Tab (Vacancies + Why Us)
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: colors.error500,
                              ),
                            )
                          : _errorMessage != null
                              ? Center(child: Text(_errorMessage!))
                              : ListView(
                                  padding: EdgeInsets.all(16.w),
                                  children: [
                                    ..._medicineVacancies.map((vacancy) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 12.h),
                                        padding: EdgeInsets.all(12.w),
                                        decoration: BoxDecoration(
                                          color: colors.shade0,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(vacancy['name'] ?? '',
                                                style: fonts.mediumMain),
                                            SizedBox(height: 8.h),
                                            Text(
                                                vacancy['description']
                                                        ?.replaceAll(
                                                            RegExp(r'<[^>]*>'),
                                                            '') ??
                                                    '',
                                                style: fonts.smallLink),
                                            12.h.verticalSpace,
                                            CButton(
                                                height: 40.h,
                                                textColor: colors.primary900,
                                                backgroundColor:
                                                    colors.neutral200,
                                                title: "get_know".tr(),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              VacancyDetailPage(
                                                                vacancyId: 608,
                                                              )));
                                                })
                                          ],
                                        ),
                                      );
                                    }).toList(),

                                    // Why Us Section
                                    Text(
                                      'Мы внимательны к тому, что важно, и предлагаем:',
                                      style: fonts.regularMain,
                                    ),
                                    SizedBox(height: 12.h),
                                    const Text(
                                      'Мы в сети многопрофильных клиник «Medion» будем для вас командой новых специалистов. У нас врачи частную, даритель и постоянно повышают свой профессиональный уровень, часть в российских и международных конференциях.',
                                    ),
                                    SizedBox(height: 40.h),
                                    Text(
                                      'Вот почему стоит выбрать нас:',
                                      style: fonts.regularMain,
                                    ),
                                    SizedBox(height: 8.h),
                                    SizedBox(
                                      height: 450,
                                      child: GridView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: _requirements.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 12.h,
                                          crossAxisSpacing: 12.w,
                                          childAspectRatio: 0.8,
                                        ),
                                        itemBuilder: (context, index) {
                                          final item = _requirements[index];
                                          return WhyUsWidget(
                                            text: item['title'] ?? '',
                                            iconUrl: item['icon'],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 40.h),
                                    _buildNoResultView(icons, fonts),
                                  ],
                                ),
                      // Office Tab
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: colors.error500,
                              ),
                            )
                          : _errorMessage != null
                              ? Center(child: Text(_errorMessage!))
                              : _officeVacancies.isEmpty
                                  ? Center(
                                      child: Text(
                                      'no_result_found'.tr(),
                                    ))
                                  : ListView(
                                      padding: EdgeInsets.all(16.w),
                                      children: [
                                        ..._officeVacancies.map((vacancy) {
                                          return Container(
                                            margin:
                                                EdgeInsets.only(bottom: 12.h),
                                            padding: EdgeInsets.all(12.w),
                                            decoration: BoxDecoration(
                                              color: colors.shade0,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  vacancy['name'] ?? '',
                                                  style: fonts.regularMain
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(height: 8.h),
                                                Text(
                                                  vacancy['description']
                                                          ?.replaceAll(
                                                              RegExp(
                                                                  r'<[^>]*>'),
                                                              '') ??
                                                      '',
                                                  style: fonts.regularMain
                                                      .copyWith(
                                                          color: colors
                                                              .neutral700),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        SizedBox(height: 40.h),
                                        _buildNoResultView(icons, fonts),
                                      ],
                                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoResultView(icons, fonts) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ResumeContainer(
          fileUploadOnTap: () async {
            try {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc', 'docx'],
              );
              if (result != null && result.files.isNotEmpty) {
                final file = result.files.first;
                return file.name;
              }
            } catch (e) {
              print('Exception in file picking: $e');
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CButton(
            title: 'submit'.tr(),
            onTap: () {
              // Add form validation and submission logic here
            },
          ),
        ),
        SizedBox(height: 28.h),
      ],
    );
  }
}
