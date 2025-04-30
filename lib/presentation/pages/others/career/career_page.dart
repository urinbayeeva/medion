import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/resume_container.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:permission_handler/permission_handler.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
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
                  title: "career".tr(),
                  centerTitle: true,
                  isBack: true,
                  trailing: SizedBox(width: 24.w),
                ),
                Container(
                  color: colors.shade0,
                  child: TabBar(
                    indicatorWeight: 3,
                    overlayColor: MaterialStateProperty.all(colors.shade0),
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    indicatorColor: colors.error500,
                    tabs: [
                      Tab(
                        child: Center(
                          child: Text(
                            "med".tr(),
                            textAlign: TextAlign.center,
                            style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                          ),
                        ),
                      ),
                      Tab(
                        child: Center(
                          child: Text(
                            "office".tr(),
                            textAlign: TextAlign.center,
                            style: fonts.xSmallLink.copyWith(fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildNoResultView(icons, fonts),
                      _buildNoResultView(icons, fonts),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        ResumeContainer(fileUpdloadOntap: () async {
          try {
            var status = await Permission.storage.status;
            if (!status.isGranted) {
              status = await Permission.storage.request();
            }

            if (status.isGranted) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'doc', 'docx'],
              ).catchError((e) {
                print("File picker error: $e");
                return null;
              });

              if (result != null && result.files.isNotEmpty) {
                final file = result.files.first;
                if (file.path != null) {
                  final filePath = file.path!;
                  final fileName = file.name;
                  print("Selected file: $fileName at $filePath");
                }
              } else {
                print("File selection cancelled or no file selected");
              }
            } else if (status.isPermanentlyDenied) {
              await openAppSettings();
            } else {
              print("Storage permission denied");
            }
          } catch (e) {
            print("Exception in file picking: $e");
          }
        }),
        const Spacer(),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CButton(title: "submit".tr(), onTap: () {}),
        ),
        28.h.verticalSpace,
      ],
    );
  }

  Widget _buildResult() {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<VacancyBloc, VacancyState>(builder: (context, state) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        );
      });
    });
  }
}
