import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/home_doctor_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class BuildDoctorsCategory extends StatelessWidget {
  const BuildDoctorsCategory({super.key, required this.titleAndAction, required this.controller});

  final Widget titleAndAction;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return BlocBuilder<DoctorBloc, DoctorState>(
          buildWhen: (o, n) => o.doctors != n.doctors,
          builder: (context, state) {
            final doctors = (state.doctors?.doctorData == null) ? [] : <DoctorData>[...state.doctors!.doctorData!];

            final limitedDoctors = <DoctorData>[...doctors.take(10)];
            if (state.fetchDoctors.isFailure ||
                state.doctors?.doctorData == null ||
                state.doctors!.doctorData!.isEmpty) {
              return const SizedBox.shrink();
            }
            if (state.fetchDoctors.isFailure) {
              return _buildDoctorsShimmer(fonts);
            }
            if (limitedDoctors.isEmpty) return const SizedBox.shrink();

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0.w),
                  child: titleAndAction,
                ),
                SizedBox(
                  height: 310.h,
                  child: ListView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: limitedDoctors.length,
                    key: const PageStorageKey<String>('home_doctors_category'),
                    itemBuilder: (context, index) {
                      final doctor = limitedDoctors[index];
                      return Padding(
                        padding: EdgeInsets.only(left: (index == 0) ? 12.w : 0),
                        child: HomeDoctorItem(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              AppRoutes.getAboutDoctorPage(
                                name: doctor.name.toString(),
                                profession: doctor.specialty.toString(),
                                status: doctor.infoDescription.toString(),
                                image: doctor.image.toString(),
                                id: doctor.id!,
                              ),
                            );
                          },
                          hasDiscount: doctor.hasDiscount ?? false,
                          imagePath: doctor.image.toString(),
                          name: doctor.name.toString(),
                          profession: doctor.specialty.toString(),
                          infoDescription: doctor.infoDescription.toString(),
                          gender: doctor.gender.toString(),
                          doctorID: doctor.id!,
                          experience: "${doctor.workExperience}",
                          academicRank: doctor.academicRank?.toString() ?? "",
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDoctorsShimmer(fonts) {
    return Column(
      children: [
        titleAndAction,
        SizedBox(
          height: 350.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: ShimmerView(
                  child: ShimmerContainer(
                    height: 350.h,
                    width: 200.w,
                    borderRadius: 12.r,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
