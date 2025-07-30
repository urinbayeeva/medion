import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/branches/component/single_branch_info.dart';
import 'package:medion/presentation/pages/others/branches/widget/image_dialog.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              12.h.horizontalSpace,
              ...state.branchDetail!.licenses!.map(
                (licenseUrl) {
                  final length = state.branchDetail!.licenses!.length;
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w, left: length == 1 ? 16.w : 0),
                    child: WScaleAnimation(
                      onTap: () {
                        final List<ContentBase> contentBaseList = state.branchDetail!.licenses!
                            .where((item) => item.isNotEmpty)
                            .map((item) => ContentBase(
                                  isVideo: false,
                                  fileLink: item,
                                  coverImage: item,
                                ))
                            .toList();

                        showImages(
                          context: context,
                          mainImage: licenseUrl,
                          height: 496,
                          width: 343,
                          images: [...contentBaseList],
                        );
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0)),
                        child: CachedNetworkImage(
                          imageUrl: licenseUrl,
                          width: 150.w,
                          errorWidget: (context, url, error) => _buildLicensePlaceholder(colors, fonts),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  void showImages({
    required BuildContext context,
    required String mainImage,
    double height = 496,
    double width = 343,
    required List<ContentBase> images,
  }) {
    MyFunctions.showImages(
      isVideo: false,
      context: context,
      mainImage: mainImage,
      images: images,
      height: height,
      width: width,
    );

    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return ImageDialog(mainImage: mainImage, images: images, height: height, width: width);
    //   },
    // );
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
