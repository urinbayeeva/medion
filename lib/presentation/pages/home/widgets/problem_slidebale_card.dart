import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ProblemSlidebaleCard extends StatefulWidget {
  const ProblemSlidebaleCard({super.key, required this.isChildren, required this.controller});

  final ScrollController controller;
  final bool isChildren;

  @override
  State<ProblemSlidebaleCard> createState() => _ProblemSlidebaleCardState();
}

class _ProblemSlidebaleCardState extends State<ProblemSlidebaleCard> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        log("🔄 ProblemSlidebaleCard build() called");
        return BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (o, n) {
            final length = o.diseases.length != n.diseases.length;
            final disease = o.diseases != n.diseases;

            log("length $length");
            log("disease $disease");
            return disease || length;
          },
          builder: (context, state) {
            log("Bloc builder working on");

            final filteredDiseases =
                state.diseases.where((disease) => disease.forChildren == widget.isChildren).toList();

            if (filteredDiseases.isEmpty || state.loading) {
              return SizedBox(
                height: 80.h,
                child: ShimmerView(
                  child: ListView.separated(
                    itemCount: 12,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 10.w.horizontalSpace,
                    itemBuilder: (context, index) {
                      return ShimmerContainer(
                        margin: EdgeInsets.fromLTRB(
                          (index == 0) ? 12.w : 0,
                          0,
                          0,
                          (index == 12) ? 12.w : 0,
                        ),
                        height: double.infinity,
                        width: 80.w,
                      );
                    },
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                key: const PageStorageKey<String>('problem_cards'),
                children: List.generate(
                  filteredDiseases.length,
                  (index) {
                    final disease = filteredDiseases[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 8.w, left: (index == 0) ? 12.w : 0),
                      child: AnimationButtonEffect(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(AppRoutes.getDirectionInfoPage(id: disease.categoryId!, name: disease.title!))
                              .then((_) {
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
                                  color: colors.error500.withValues(alpha: 0.05),
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
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
