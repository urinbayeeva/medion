import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/helpers/decode_html.dart';

class BuildDoctorsCategory extends StatelessWidget {
  const BuildDoctorsCategory({super.key, required this.titleAndAction});

  final Widget titleAndAction;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<DoctorBloc, DoctorState>(
          buildWhen: (o, n) => o.doctors != n.doctors,
          builder: (context, state) {
            final doctors = (state.doctors?.doctorData != null)
                ? state.doctors!.doctorData!
                    .map(
                      (category) => {
                        'name': category.name,
                        'profession': category.specialty.toString(),
                        'image': category.image,
                        'id': category.id,
                        'work_experience': category.workExperience.toString(),
                        'info_description': decodeHtml(category.infoDescription.toString()),
                        'gender': category.gender.toString(),
                        'has_discount': category.hasDiscount,
                        'academic_rank': category.academicRank,
                      },
                    )
                    .toList()
                : [];

            final limitedDoctors = doctors.take(10).toList();
            if (state.error || state.doctors?.doctorData == null || state.doctors!.doctorData!.isEmpty) {
              return const SizedBox.shrink();
            }
            if (!state.success) {
              return _buildDoctorsShimmer(fonts);
            }
            if (limitedDoctors.isEmpty) return const SizedBox.shrink();

            return Column(
              children: [
                titleAndAction,
                SizedBox(
                  height: 330.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: limitedDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = limitedDoctors[index];
                      return DoctorsItem(
                        onTap: () {
                          context.read<BottomNavBarController>().changeNavBar(true);
                          Navigator.push(
                            context,
                            AppRoutes.getAboutDoctorPage(
                              name: doctor['name'].toString(),
                              profession: doctor['profession'].toString(),
                              status: doctor['name'].toString(),
                              image: doctor['image'].toString(),
                              id: doctor['id'],
                            ),
                          ).then((_) {
                            context.read<BottomNavBarController>().changeNavBar(false);
                          });
                        },
                        hasDiscount: doctor['has_discount'] ?? false,
                        imagePath: doctor['image'].toString(),
                        name: doctor['name'].toString(),
                        profession: doctor['profession'].toString(),
                        status: doctor['profession'].toString(),
                        gender: doctor['gender'].toString(),
                        candidateScience: false,
                        isInnerPageUsed: true,
                        doctorID: doctor['id'],
                        experience: "experience".tr(namedArgs: {"count": doctor['work_experience'].toString()}),
                        academicRank: doctor['academic_rank']?.toString() ?? "",
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
