import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/sources/category.dart';
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
  Category selectedCategory = Category.all;

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
                      onTap: () async {
                        final result = await showModalBottomSheet<Category>(
                          isDismissible: true,
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
                            ...state.doctors.map((category) {
                              var filteredDoctors = category.doctorData
                                  .where((doctor) => _matchesCategory(doctor))
                                  .map((doctor) => {
                                        'name': doctor.name.toString(),
                                        'profession': doctor.specialty?.value
                                                .toString() ??
                                            'N/A',
                                        'image':
                                            doctor.image?.value.toString() ??
                                                '',
                                        'category':
                                            category.categoryName.toString(),
                                      })
                                  .toList();

                              if (filteredDoctors.isEmpty &&
                                  selectedCategory != Category.all) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      icons.emojiSad
                                          .svg(width: 80.w, height: 80.h),
                                      Center(
                                        child: Text(
                                          "no_result_found".tr(),
                                          style: fonts.mediumMain.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return _buildDoctorCategoryList(
                                  category.categoryName, filteredDoctors);
                            }),
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
      // case Category.allergology:
      //   return specialty.contains('аллерголог');
      // case Category.allergologyAndImmunology:
      //   return specialty.contains('аллерголог') ||
      //       specialty.contains('иммунолог');
      // case Category.analgesicsNonNarcotic:
      //   return specialty.contains('анальгезирующие');
      // case Category.andrology:
      //   return specialty.contains('андролог');
      // case Category.anesthesiology:
      //   return specialty.contains('анестезиолог');
      // case Category.anesthesiologyAndPerfusion:
      //   return specialty.contains('анестезиолог') ||
      //       specialty.contains('перфузиолог');
      // case Category.autoimmunePathology:
      //   return specialty.contains('аутоиммунная');
      // case Category.gastroenterology:
      //   return specialty.contains('гастроэнтеролог');
      // case Category.pediatricDentistry:
      //   return specialty.contains('детский') &&
      //       specialty.contains('стоматолог');
      // case Category.implantation:
      //   return specialty.contains('имплантация') ||
      //       specialty.contains('стоматолог');
      // case Category.injectionCosmetology:
      //   return specialty.contains('косметолог');
      // case Category.canalTreatment:
      //   return specialty.contains('канал') && specialty.contains('стоматолог');
      // case Category.mrt:
      //   return specialty.contains('мрт');
      // case Category.uncategorized:
      //   return specialty == '' || specialty == 'doctor' || specialty == 'false';
      // case Category.oncology:
      //   return specialty.contains('онколог') ||
      //       specialty.contains('онкохирург');
      // case Category.orthopedicDentistry:
      //   return specialty.contains('ортопед') &&
      //       specialty.contains('стоматолог');
      // case Category.periodontology:
      //   return specialty.contains('пародонтолог');
      // case Category.sealingTeeth:
      //   return specialty.contains('пломбирование') &&
      //       specialty.contains('стоматолог');
      // case Category.proceduralRoom:
      //   return specialty.contains('процедурный');
      // case Category.unsealingAndTreatment:
      //   return specialty.contains('распломбировка') &&
      //       specialty.contains('стоматолог');
      // case Category.rheumatology:
      //   return specialty.contains('ревматолог');
      // case Category.sedation:
      //   return specialty.contains('седация');
      // case Category.serologicalStudies:
      //   return specialty.contains('серолог');
      // case Category.dentalSurgery:
      //   return specialty.contains('хирург') && specialty.contains('стоматолог');
      // case Category.therapeuticDentistry:
      //   return specialty.contains('терапевт') &&
      //       specialty.contains('стоматолог');
      // case Category.therapy:
      //   return specialty.contains('терапевт');
      // case Category.ultrasound:
      //   return specialty.contains('узи');
      // case Category.physiotherapy:
      //   return specialty.contains('физиотерапия');
      // case Category.surgery:
      //   return specialty.contains('хирург');
      // case Category.endocrinology:
      //   return specialty.contains('эндокринолог');
      // case Category.endoscopy:
      //   return specialty.contains('эндоскоп');
      case Category.all:
        return true;
    }
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
                        AppRoutes.getAboutDoctorPage(
                            doctor['name'].toString(),
                            doctor['profession'],
                            doctor['name'].toString(),
                            doctor['image'].toString(),
                            doctor['id']));
                  },
                  categoryType: doctor['category'].toString(),
                  imagePath: doctor['image'].toString(),
                  name: doctor['name'].toString(),
                  profession: doctor['profession'].toString(),
                  status: doctor['status']?.toString() ?? 'N/A',
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
