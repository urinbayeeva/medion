import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_filter_bottomsheet.dart';
import 'package:medion/presentation/component/c_toggle.dart';
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    icons.search.svg(width: 24.w, height: 24.h),
                    20.w.horizontalSpace,
                    AnimationButtonEffect(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: colors.shade0,
                          builder: (context) => const CFilterBottomsheet(),
                        );
                      },
                      child: icons.filter.svg(width: 24.w, height: 24.h),
                    ),
                  ],
                ),
                bottom: CustomToggle(
                  iconList: [
                    Text(
                      'doctors_of_medion'.tr(),
                      style: fonts.xSmallLink.copyWith(
                        color:
                            isMedionDoctor ? colors.shade0 : colors.primary900,
                      ),
                    ),
                    Text(
                      'foreign_doctors'.tr(),
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
                child: BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    if (state.error) {
                      return Center(
                          child: Text('something_went_wrong'.tr(),
                              style: fonts.regularSemLink));
                    }

                    return SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isMedionDoctor) ...[
                            ...state.doctors
                                .map((category) => _buildDoctorCategoryList(
                                      category.categoryName,
                                      category.doctorData
                                          .map((doctor) => {
                                                'name': doctor.name.toString(),
                                                'profession': doctor.specialty.toString(),
                                                'image': doctor.image.toString(),
                                                // 'status':
                                                //     doctor.workPhone as int,
                                                // 'candidateScience':
                                                //     doctor.academicRank,
                                                'category':
                                                    category.categoryName.toString(),
                                              })
                                          .toList(),
                                    )),
                          ] else ...[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  icons.emojiSad.svg(width: 80.w, height: 80.h),
                                  Center(
                                    child: Text(
                                      "no_result_found".tr(),
                                      style: fonts.mediumMain.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ],
                      ),
                    );
                  },
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
            GridView.builder(
              shrinkWrap: true,
              itemCount: doctors.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 0.53,
              ),
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorsItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        AppRoutes.getAboutDoctorPage(doctor['name'].toString(),
                            doctor['profession'], doctor['name'].toString()));
                  },
                  categoryType: doctor['category'].toString(),
                  imagePath: doctor['image'].toString(),
                  name: doctor['name'].toString(),
                  profession: doctor['profession'].toString(),
                  status: doctor['status'].toString(),
                  candidateScience: doctor['candidateScience'],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
