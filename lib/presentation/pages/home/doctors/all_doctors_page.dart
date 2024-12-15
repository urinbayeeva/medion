import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/sources/foreign_doctors.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/domain/sources/doctors_data.dart';
import 'package:medion/presentation/component/c_filter_bottomsheet.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class AllDoctorsPage extends StatefulWidget {
  const AllDoctorsPage({Key? key}) : super(key: key);

  @override
  State<AllDoctorsPage> createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  bool isMedionDoctor = true;

  Map<String, List<Map<String, dynamic>>> groupDoctorsByCategory(
      List<Map<String, dynamic>> doctorsData) {
    return doctorsData.fold({}, (grouped, doctor) {
      final category = doctor['category'] as String;
      grouped.putIfAbsent(category, () => []).add(doctor);
      return grouped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupedDoctors = groupDoctorsByCategory(doctorsData);
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CAppBar(
                title: "            Врачи",
                isBack: true,
                hasToggle: true,
                centerTitle: true,
                toggleFirstText: "Врачи Медион",
                toggleSecondText: "Зарубежные врачи",
                onTap: () {
                  context.read<BottomNavBarController>().changeNavBar(false);
                  Navigator.pop(context);
                },
                trailing: Row(
                  children: [
                    icons.search.svg(width: 24.w, height: 24.h),
                    20.w.horizontalSpace,
                    AnimationButtonEffect(
                        onTap: () {
                          showModalBottomSheet(
                            isDismissible: true,
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: colors.shade0,
                            builder: (context) {
                              return const CFilterBottomsheet();
                            },
                          );
                        },
                        child: icons.filter.svg(width: 24.w, height: 24.h)),
                  ],
                ),
                bottom: CustomToggle(
                  iconList: [
                    Text(
                      'Врачи Медион',
                      style: fonts.xSmallLink.copyWith(
                        color:
                            isMedionDoctor ? colors.shade0 : colors.primary900,
                      ),
                    ),
                    Text(
                      'Зарубежные врачи',
                      style: fonts.xSmallLink.copyWith(
                        color:
                            !isMedionDoctor ? colors.shade0 : colors.primary900,
                      ),
                    ),
                  ],
                  onChanged: (value) => setState(() => isMedionDoctor = value),
                  current: isMedionDoctor,
                  values: const [true, false],
                ),
              ),
              8.h.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isMedionDoctor) ...[
                        _buildDoctorCategoryList("Врачи", doctorsData),
                        12.h.verticalSpace,
                        for (var entry in groupedDoctors.entries)
                          _buildDoctorCategoryList(entry.key, entry.value),
                      ] else ...[
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: foreignDoctorsData.length,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  childAspectRatio: 0.53),
                          itemBuilder: (context, index) {
                            final doctor = foreignDoctorsData[index];
                            return DoctorsItem(
                              onTap: () {},
                              imagePath: doctor['image'],
                              name: doctor['name'],
                              profession: doctor['profession'],
                              status: doctor['status'],
                              candidateScience: doctor['candidateScience'],
                            );
                          },
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDoctorCategoryList(
      String category, List<Map<String, dynamic>> doctors) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category, style: fonts.regularSemLink),
            12.h.verticalSpace,
            SizedBox(
              height: 380.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: doctors.length,
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorsItem(
                    onTap: () {
                      Navigator.push(context, AppRoutes.getAboutDoctorPage());
                    },
                    categoryType: doctor['category'],
                    imagePath: doctor['image'],
                    name: doctor['name'],
                    profession: doctor['profession'],
                    status: doctor['status'],
                    candidateScience: doctor['candidateScience'],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
