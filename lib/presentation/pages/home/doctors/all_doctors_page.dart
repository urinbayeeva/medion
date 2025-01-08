// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medion/application/doctor/doctor_bloc.dart';
// import 'package:medion/domain/sources/foreign_doctors.dart';
// import 'package:medion/presentation/component/animation_effect.dart';
// import 'package:medion/presentation/component/c_appbar.dart';
// import 'package:medion/domain/sources/doctors_data.dart';
// import 'package:medion/presentation/component/c_filter_bottomsheet.dart';
// import 'package:medion/presentation/component/c_toggle.dart';
// import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
// import 'package:medion/presentation/routes/routes.dart';
// import 'package:medion/presentation/styles/style.dart';
// import 'package:medion/presentation/styles/theme.dart';
// import 'package:medion/presentation/styles/theme_wrapper.dart';

// class AllDoctorsPage extends StatefulWidget {
//   const AllDoctorsPage({super.key});

//   @override
//   State<AllDoctorsPage> createState() => _AllDoctorsPageState();
// }

// class _AllDoctorsPageState extends State<AllDoctorsPage> {
//   bool isMedionDoctor = true;

//   Map<String, List<Map<String, dynamic>>> groupDoctorsByCategory(
//       List<Map<String, dynamic>> doctorsData) {
//     return doctorsData.fold({}, (grouped, doctor) {
//       final category = doctor['category'] as String;
//       grouped.putIfAbsent(category, () => []).add(doctor);
//       return grouped;
//     });
//   }

//   @override
//   void initState() {
//     context.read<DoctorBloc>().add(const DoctorEvent.getDoctors());

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final groupedDoctors = groupDoctorsByCategory(doctorsData);
//     return BlocBuilder<DoctorBloc, DoctorState>(builder: (context, state) {
//       if (state.doctors == null) {
//         return Center(
//           child: Text(
//             semanticsLabel: "no_result_found".tr(),
//             "no_result_found".tr(),
//             style: Style.headlineMain(),
//           ),
//         );
//       }
//       return ThemeWrapper(
//         builder: (context, colors, fonts, icons, controller) {
//           return Scaffold(
//             backgroundColor: colors.backgroundColor,
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CAppBar(
//                   title: "\t\t\t\t\t\tВрачи",
//                   isBack: true,
//                   hasToggle: true,
//                   centerTitle: true,
//                   toggleFirstText: "Врачи Медион",
//                   toggleSecondText: "Зарубежные врачи",
//                   trailing: Row(
//                     children: [
//                       icons.search.svg(width: 24.w, height: 24.h),
//                       20.w.horizontalSpace,
//                       AnimationButtonEffect(
//                           onTap: () {
//                             showModalBottomSheet(
//                               isDismissible: true,
//                               context: context,
//                               isScrollControlled: true,
//                               backgroundColor: colors.shade0,
//                               builder: (context) {
//                                 return const CFilterBottomsheet();
//                               },
//                             );
//                           },
//                           child: icons.filter.svg(width: 24.w, height: 24.h)),
//                     ],
//                   ),
//                   bottom: CustomToggle(
//                     iconList: [
//                       Text(
//                         'Врачи Медион',
//                         style: fonts.xSmallLink.copyWith(
//                           color: isMedionDoctor
//                               ? colors.shade0
//                               : colors.primary900,
//                         ),
//                       ),
//                       Text(
//                         'Зарубежные врачи',
//                         style: fonts.xSmallLink.copyWith(
//                           color: !isMedionDoctor
//                               ? colors.shade0
//                               : colors.primary900,
//                         ),
//                       ),
//                     ],
//                     onChanged: (value) =>
//                         setState(() => isMedionDoctor = value),
//                     current: isMedionDoctor,
//                     values: const [true, false],
//                   ),
//                 ),
//                 8.h.verticalSpace,
//                 Expanded(
//                   child: SingleChildScrollView(
//                     physics: const ScrollPhysics(),
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (isMedionDoctor) ...[
//                           _buildDoctorCategoryList("Врачи", doctorsData),
//                           12.h.verticalSpace,
//                           for (var entry in groupedDoctors.entries)
//                             _buildDoctorCategoryList(entry.key, entry.value),
//                         ] else ...[
//                           GridView.builder(
//                             shrinkWrap: true,
//                             itemCount: foreignDoctorsData.length,
//                             padding: EdgeInsets.zero,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     crossAxisSpacing: 12.0,
//                                     mainAxisSpacing: 12.0,
//                                     childAspectRatio: 0.53),
//                             itemBuilder: (context, index) {
//                               final doctor = foreignDoctorsData[index];
//                               return DoctorsItem(
//                                 onTap: () {},
//                                 imagePath: doctor['image'],
//                                 name: doctor['name'],
//                                 profession: doctor['profession'],
//                                 status: doctor['status'],
//                                 candidateScience: doctor['candidateScience'],
//                               );
//                             },
//                           ),
//                         ]
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }

//   Widget _buildDoctorCategoryList(
//       String category, List<Map<String, dynamic>> doctors) {
//     return ThemeWrapper(
//       builder: (context, colors, fonts, icons, controller) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(category, style: fonts.regularSemLink),
//             12.h.verticalSpace,
//             SizedBox(
//               height: 380.h,
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: doctors.length,
//                 scrollDirection: Axis.horizontal,
//                 // shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   final doctor = doctors[index];
//                   return DoctorsItem(
//                     onTap: () {
//                       Navigator.push(context, AppRoutes.getAboutDoctorPage());
//                     },
//                     categoryType: doctor['category'],
//                     imagePath: doctor['image'],
//                     name: doctor['name'],
//                     profession: doctor['profession'],
//                     status: doctor['status'],
//                     candidateScience: doctor['candidateScience'],
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medion/application/doctor/doctor_bloc.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen();

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  void initState() {
    context.read<DoctorBloc>().add(DoctorEvent.fetchDoctors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctors')),
      body: BlocBuilder<DoctorBloc, DoctorState>(
        builder: (context, state) {
          if (state.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.success) {
            return ListView.builder(
              itemCount: state.doctors.length,
              itemBuilder: (context, index) {
                final category = state.doctors[index];
                return ExpansionTile(
                  title: Text(category.category_name),
                  children: category.doctor_data
                      .map((doctor) => ListTile(
                            title: Text(doctor.name),
                            subtitle: Text(doctor.specialty),
                          ))
                      .toList(),
                );
              },
            );
          } else if (state.error) {
            return Center(child: Text('Failed to fetch doctors'));
          }
          return Container();
        },
      ),
    );
  }
}
