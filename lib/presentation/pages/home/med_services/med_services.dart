import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServicesPage extends StatelessWidget {
  const MedServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("med_services".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (o, n) {
              final service = o.medicalServices != n.medicalServices;
              final length = o.medicalServices.length != n.medicalServices.length;
              return service || length;
            },
            builder: (context, state) {
              if (state.loading || state.medicalServices.isEmpty) {
                return _buildShimmerView(colors);
              }
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: state.medicalServices.length,
                itemBuilder: (context, index) {
                  return MedServicesCard(
                    title: state.medicalServices[index].title,
                    subtitle: state.medicalServices[index].info,
                    iconPath: state.medicalServices[index].image,
                    onTap: () {
                      final categoryId = state.medicalServices[index].categoryId;
                      final intId = categoryId is int ? categoryId : int.parse(categoryId.toString());

                      Navigator.push(
                        context,
                        AppRoutes.getDirectionInfoPage(id: intId, name: state.medicalServices[index].title),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildShimmerView(dynamic colors) {
    return ShimmerView(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 5, // Show 5 placeholders
        itemBuilder: (context, index) {
          return ShimmerContainer(
            height: 100.h,
            borderRadius: 8.r,
            margin: EdgeInsets.only(bottom: 12.h),
          );
        },
      ),
    );
  }
}

class MedServicesCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? iconPath;
  final VoidCallback onTap;

  const MedServicesCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.h),
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: iconPath == null || iconPath == ""
                    ? Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: colors.error500.withValues(alpha: 0.05),
                        ),
                        child: icons.stethoscope.svg(
                          color: colors.error500,
                          width: 50.w,
                          height: 50.h,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: colors.error500.withValues(alpha: 0.05),
                        ),
                        child: CommonImage(
                          imageUrl: iconPath!,
                          width: 50.w,
                          height: 50.h,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              title: Text(
                title ?? "Unknown Service",
                style: fonts.smallSemLink.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                subtitle == "null" ? "" : subtitle!,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: fonts.xSmallText.copyWith(
                  color: colors.neutral600,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
