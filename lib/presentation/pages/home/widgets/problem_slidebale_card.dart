import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ProblemSlidebaleCard extends StatefulWidget {
  final bool isChildren;

  const ProblemSlidebaleCard({super.key, required this.isChildren});

  @override
  State<ProblemSlidebaleCard> createState() => _ProblemSlidebaleCardState();
}

class _ProblemSlidebaleCardState extends State<ProblemSlidebaleCard> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.fetchDiseases());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.loading) {
            return const SizedBox.shrink();
          }

          final filteredDiseases = state.diseases.where((disease) => disease.forChildren == widget.isChildren).toList();
          print("Filtered diseases: ${filteredDiseases.length} items for isChildren: ${widget.isChildren}");

          if (filteredDiseases.isEmpty) {
            return Center(
              child: Text(
                "",
                style: fonts.xSmallLink.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(filteredDiseases.length, (index) {
                final disease = filteredDiseases[index];

                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: AnimationButtonEffect(
                    onTap: () {
                      context.read<BottomNavBarController>().changeNavBar(true);
                      Navigator.push(
                        context,
                        AppRoutes.getDirectionInfoPage(id: disease.categoryId!, name: disease.title!),
                      ).then((_) {
                        context.read<BottomNavBarController>().changeNavBar(false);
                      });
                    },
                    child: Container(
                      width: 109.w,
                      height: 124.h,
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: colors.shade0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: colors.error500.withOpacity(0.05),
                            ),
                            child: CachedImageComponent(height: 48.w, width: 48.w, imageUrl: disease.icon!),
                          ),
                          8.h.verticalSpace,
                          Text(
                            disease.title ?? ''.tr(),
                            style: fonts.xSmallText.copyWith(
                              color: colors.primary900,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      );
    });
  }
}
