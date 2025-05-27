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
import 'package:medion/presentation/pages/others/career/widgets/why_us_widget.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:permission_handler/permission_handler.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  final List<String> whyUsTexts = [
    "понятная система оплаты, конкурентная заработная плата, своевременные выплаты и бонусы;",
    "возможность карьерного роста и профессионального развития;",
    "дружный коллектив и комфортные условия труда;",
    "современное оборудование и инновационные технологии;",
  ];
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Text("Мы внимательны к тому, что важно, и предлагаем: ",
                            style: fonts.regularMain),
                        12.h.verticalSpace,
                        const Text(
                          "Мы в сети многопрофильных клиник «Medion» всегда ждем в своей команде новых специалистов. У нас врачи растут, развиваются и постоянно повышают свой профессиональный уровень, участвуя в российских и международных конференциях",
                        ),
                        40.h.verticalSpace,
                        Text("Вот почему стоит выбрать нас:",
                            style: fonts.regularMain),
                        8.h.verticalSpace,
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: whyUsTexts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            return WhyUsWidget(text: whyUsTexts[index]);
                          },
                        ),
                        20.h.verticalSpace,
                        Text("Врачи", style: fonts.regularMain),
                        8.h.verticalSpace,
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: whyUsTexts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            return WhyUsWidget(text: whyUsTexts[index]);
                          },
                        ),
                      ],
                    ),
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
        ResumeContainer(
          fileUploadOnTap: () async {
            try {
              var status = await Permission.storage.status;
              if (!status.isGranted) {
                status = await Permission.storage.request();
              }

              if (status.isGranted) {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc', 'docx'],
                );

                if (result != null && result.files.isNotEmpty) {
                  final file = result.files.first;
                  if (file.path != null) {
                    return file.name;
                  }
                }
              } else if (status.isPermanentlyDenied) {
                await openAppSettings();
              }
            } catch (e) {
              print("Exception in file picking: $e");
            }
            return null;
          },
        ),
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
