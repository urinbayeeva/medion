import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/styles/theme.dart';

class Licenses extends StatelessWidget {
  const Licenses({
    super.key,
    required this.available,
    required this.fonts,
    required this.state,
    required this.colors,
  });

  final bool available;
  final FontSet fonts;
  final BranchState state;
  final CustomColorSet colors;

  @override
  Widget build(BuildContext context) {
    if (!available) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        12.h.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "license".tr(),
              style: fonts.regularMain.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        8.h.verticalSpace,
        Row(
          children: state.branchDetail!.licenses!.map((licenseUrl) {
            final length = state.branchDetail!.licenses!.length;
            return Padding(
              padding: EdgeInsets.only(right: 8.w, left: length == 1 ? 16 : 0),
              child: DecoratedBox(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0)),
                child: CachedNetworkImage(
                  imageUrl: licenseUrl,
                  width: 150.w,
                  errorWidget: (context, url, error) => _buildLicensePlaceholder(colors, fonts),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildLicensePlaceholder(colors, fonts) {
    return Container(
      width: 150.w,
      height: 100.h,
      color: colors.neutral200,
      child: Center(
        child: Text(
          "no_result_found".tr(),
          style: fonts.smallLink,
        ),
      ),
    );
  }
}
