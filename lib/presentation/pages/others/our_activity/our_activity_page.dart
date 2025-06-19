import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/pages/others/our_activity/our_api.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OurActivityPage extends StatefulWidget {
  const OurActivityPage({super.key});

  @override
  State<OurActivityPage> createState() => _OurActivityPageState();
}

class _OurActivityPageState extends State<OurActivityPage> {
  late Future<Map<String, dynamic>> _companyData;
  final MedionApiService _apiService = MedionApiService();

  @override
  void initState() {
    super.initState();
    _companyData = _apiService.getCompanyActivity();
  }

  String _removeHtmlTags(String htmlString) {
    return htmlString.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                title: "our_activities".tr(),
                isBack: true,
                centerTitle: true,
                trailing: 24.w.horizontalSpace,
              ),
              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: _companyData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available'));
                    }

                    final data = snapshot.data!;
                    final about = _removeHtmlTags(data['about'] ?? '');
                    final history = _removeHtmlTags(data['history'] ?? '');
                    final mission = _removeHtmlTags(data['mission'] ?? '');

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 180.h,
                          child: PatternBackground(
                            patternTitle:
                                data['name'] ?? "medion_activity".tr(),
                          ),
                        ),
                        const CDivider(padding: false),
                        CustomTabbarBlack(
                          tabs: [
                            "about_the_company".tr(),
                            "history".tr(),
                            "mission".tr(),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              // About tab
                              SingleChildScrollView(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      24.h.verticalSpace,
                                      Text("about_the_company".tr(),
                                          style: fonts.regularMain),
                                      8.h.verticalSpace,
                                      CContainer(text: about),
                                      24.h.verticalSpace,
                                    ],
                                  ),
                                ),
                              ),
                              // History tab
                              SingleChildScrollView(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      24.h.verticalSpace,
                                      Text("history".tr(),
                                          style: fonts.regularMain),
                                      8.h.verticalSpace,
                                      CContainer(text: history),
                                      24.h.verticalSpace,
                                    ],
                                  ),
                                ),
                              ),
                              // Mission tab
                              SingleChildScrollView(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      24.h.verticalSpace,
                                      Text("mission".tr(),
                                          style: fonts.regularMain),
                                      8.h.verticalSpace,
                                      CContainer(text: mission),
                                      24.h.verticalSpace,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
