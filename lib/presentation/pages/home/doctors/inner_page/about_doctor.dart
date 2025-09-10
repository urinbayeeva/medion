import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/error_progress_ui.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/build_schedule.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctor_info_card_with_type.dart';
import 'package:medion/presentation/pages/home/doctors/widget/gallery_item_widget.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/customer_review/generate_star.dart';
import 'package:medion/presentation/pages/others/dicsount/widgets/discount_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/content_type_enum.dart';
import 'package:medion/utils/enums/doctor_info_enum.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class AboutDoctor extends StatefulWidget {
  final String? name;
  final String? profession;
  final String? status;
  final String? image;
  final int id;

  const AboutDoctor({
    super.key,
    this.name,
    this.profession,
    this.status,
    this.image,
    required this.id,
  });

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();
}

class _AboutDoctorState extends State<AboutDoctor> {
  final ValueNotifier<int> _index = ValueNotifier(0);
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(DoctorEvent.fetchDoctorDetails(widget.id));
  }

  String _formatDiscountDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'дата не указана'.tr();
    }
    try {
      return _dateFormat.format(DateTime.parse(date));
    } catch (e) {
      return 'неверный формат даты'.tr();
    }
  }

  void tabForScrollSection(int index, List<DoctorsInfo> doctorInfoTabs) {
    final GlobalKey key = doctorInfoTabs[index].itemKey;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: -0.2,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<DoctorBloc, DoctorState>(
          builder: (context, state) {
            if (state.doctorSingleStatus.isInProgress || state.doctorSingleStatus.isInitial) {
              return const UiHelper(isFailure: false);
            }
            if (state.doctorSingleStatus.isFailure) {
              return const UiHelper(isFailure: true);
            }

            return DefaultTabController(
              length: state.doctorInfoItems.where((e) => e.canSee).toList().length,
              child: Scaffold(
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
                  title: Text("doctors".tr(), style: fonts.regularMain),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: colors.shade0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.doctorDetails != null) ...{
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: AboutDoctorWidget(
                                experience: state.doctorDetails!.experienceYear,
                                doctorID: widget.id,
                                name: state.doctorDetails!.name,
                                profession: state.doctorDetails!.jobName,
                                specialty: state.doctorDetails!.decodedDescription.toString(),
                                image: state.doctorDetails!.image,
                              ),
                            ),
                          } else ...{
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: AboutDoctorWidget(
                                experience: state.doctorDetails?.experienceYear,
                                doctorID: widget.id,
                                name: state.doctorDetails?.name ?? "",
                                profession: widget.profession,
                                specialty: widget.status,
                                image: widget.image,
                              ),
                            ),
                          },
                          ValueListenableBuilder(
                            valueListenable: _index,
                            builder: (ctx, val, child) {
                              return CustomTabbarBlack(
                                tabs: state.doctorInfoItems.where((e) => e.canSee).map((e) => e.title.tr()).toList(),
                                onTap: (val) {
                                  _index.value = val;
                                  tabForScrollSection(val, state.doctorInfoItems);
                                },
                                selectedIndex: _index.value,
                                padding: EdgeInsets.only(right: 12.w),
                                labelPadding: EdgeInsets.only(right: 16.w, left: 12),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _controller,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                              state.doctorInfoItems.length,
                              (index) {
                                final item = state.doctorInfoItems[index];
                                final doctor = state.doctorDetails!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (item.checker.isAbout && item.canSee) ...{
                                      SizedBox(key: item.itemKey, width: 1.sw),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                              vertical: 10.h,
                                            ).copyWith(top: 20.h),
                                            child: Text(
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          Container(
                                            width: 1.sw,
                                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                            decoration: BoxDecoration(color: colors.shade0),
                                            child: Text(
                                              doctor.decodedDescription,
                                              style: fonts.xSmallLink,
                                            ),
                                          ),
                                        ],
                                      )
                                    },
                                    if (item.checker.isDiscount && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          10.h.verticalSpace,
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                            child: Text(
                                              key: item.itemKey,
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          discount(context: context, colors: colors, fonts: fonts, doctor: doctor)
                                        ],
                                      )
                                    },
                                    if (item.checker.isExperience && item.canSee) ...{
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 10.h,
                                        ).copyWith(top: 20.h),
                                        child: Text(
                                          item.title.tr(),
                                          style: fonts.regularMain,
                                          key: item.itemKey,
                                        ),
                                      ),
                                      _buildExperienceTab(doctor, colors, fonts, icons),
                                    },
                                    if (item.checker.isEducation && item.canSee) ...{
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 10.h,
                                        ).copyWith(top: 20.h),
                                        child: Text(
                                          item.title.tr(),
                                          style: fonts.regularMain,
                                          key: item.itemKey,
                                        ),
                                      ),
                                      _buildEducationTab(doctor, colors, fonts, icons),
                                    },
                                    if (item.checker.isWorkTime && item.canSee) ...{
                                      12.h.verticalSpace,
                                      SizedBox(
                                        key: item.itemKey,
                                        child: BuildSchedule(
                                          title: item.title.tr(),
                                          schedule: doctor.workSchedule,
                                          colors: colors,
                                          fonts: fonts,
                                          doctor: doctor,
                                        ),
                                      )
                                    },
                                    if (item.checker.isAchievements && item.canSee) ...{
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 10.h,
                                        ).copyWith(top: 20.h),
                                        child: Text(
                                          item.title.tr(),
                                          style: fonts.regularMain,
                                          key: item.itemKey,
                                        ),
                                      ),
                                      _achievements(
                                        awards: doctor.award.toList(),
                                        colors: colors,
                                        fonts: fonts,
                                        icons: icons,
                                      ),
                                    },
                                    if (item.checker.isGallery && item.canSee) ...{
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 10.h,
                                        ).copyWith(top: 20.h),
                                        child: Text(
                                          item.title.tr(),
                                          style: fonts.regularMain,
                                          key: item.itemKey,
                                        ),
                                      ),
                                      GalleryItemWidget(gallery: doctor.galleryItems.toList())
                                    },
                                    if (item.checker.isReviews && item.canSee) ...{
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 10.h,
                                        ).copyWith(top: 20.h),
                                        child: Text(
                                          item.title.tr(),
                                          style: fonts.regularMain,
                                          key: item.itemKey,
                                        ),
                                      ),
                                      _reviews(
                                        reviews: doctor.reviews.toList(),
                                        colors: colors,
                                        fonts: fonts,
                                        icons: icons,
                                      )
                                    },
                                    if (item.checker.isArticles && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(
                                          item.title.tr(),
                                          style: fonts.regularMain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: _articles(
                                          articles: doctor.articles.toList(),
                                          colors: colors,
                                          fonts: fonts,
                                        ),
                                      ),
                                      SizedBox(key: item.itemKey)
                                    },
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _reviews({
    required List<DoctorReview> reviews,
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
  }) {
    if (reviews.isEmpty) {
      return _empty(colors, fonts);
    }
    return Column(
      children: [
        ...List.generate(
          reviews.length,
          (i) {
            final DoctorReview item = reviews[i];
            final rating = int.tryParse(item.ratings ?? '') ?? 0;

            return ReviewCardNew(
              review: item.review ?? '',
              name: item.patientName ?? '',
              clinicLocation: item.location ?? "",
              clinicName: item.companyName ?? "",
              clinicImage: item.companyLogoUrl ?? "",
              date: item.createDate ?? "",
              integratorLogoUrl: item.integratorLogoUrl ?? "",
              rating: rating,
            );
          },
        ),
      ],
    );
  }

  Widget _articles({
    required List<Articles> articles,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    if (articles.isEmpty) {
      return _empty(colors, fonts);
    }
    return SizedBox(
      height: 118,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8,
          children: [
            ...List.generate(
              articles.length,
              (i) {
                final item = articles[i];
                return Container(
                  margin: EdgeInsets.fromLTRB(i == 0 ? 10 : 0, 0, 0, 0),
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w500)),
                      WScaleAnimation(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            AppRoutes.getInfoViewAboutHealth(
                              id: item.id,
                              type: ContentTypeEnum.article,
                              // discountCondition: "",
                              // date: '',
                              // imagePath: [...item.images, item.primaryImage],
                              // title: item.title,
                              // desc: item.description,
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Читать подробно",
                              style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w500, color: colors.error500),
                            ),
                            Icon(Icons.arrow_forward_ios, color: colors.error500, size: 12)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _empty(CustomColorSet colors, FontSet fonts) {
    return Container(
      height: 118,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: colors.shade0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text("no_result_found".tr(), style: fonts.regularMain)),
    );
  }

  Widget _achievements({
    required List<DoctorInfoDetails> awards,
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
  }) {
    if (awards.isEmpty) {
      return _empty(colors, fonts);
    }

    return DecoratedBox(
      decoration: BoxDecoration(color: colors.shade0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            10.h.verticalSpace,
            ...List.generate(awards.length, (index) {
              final award = awards[index];
              return DoctorInfoCardWithType(
                type: DoctorInfoTypeEnum.achievement,
                date: award.date ?? '',
                title: award.title ?? "",
                subTitle: award.description.toList(),
                image: award.icon ?? '',
                certificateSeries: award.certificateSeries,
                educationDagre: award.educationDegree,
              );
            }),
            10.h.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget discount({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required ModelDoctor doctor,
  }) {
    if (doctor.hasDiscount && doctor.discount.isNotEmpty) {
      final list = <Discount>[...doctor.discount];
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8,
          children: [
            ...List.generate(
              list.length,
              (i) {
                final item = list[i];
                return Padding(
                  padding: EdgeInsets.only(left: (i == 0) ? 12.w : 4.w),
                  child: SizedBox(
                    width: 163.w,
                    height: 255.h,
                    child: DiscountCard(
                      title: item.title ?? "",
                      image: item.image ?? "",
                      date: _formatDiscountDate(item.discountEndDate),
                      onTap: () {
                        if (item.id != null) {
                          Navigator.push(
                            context,
                            AppRoutes.getInfoViewAboutHealth(
                              id: item.id!,
                              type: ContentTypeEnum.discount,
                            ),
                          );
                        } else {
                          context.showPopUp(
                            status: PopUpStatus.warning,
                            message: "no_results_found".tr(),
                            fonts: fonts,
                            colors: colors,
                            context: context,
                          );
                        }
                      },
                      colors: colors,
                      fonts: fonts,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildExperienceTab(ModelDoctor doctor, CustomColorSet colors, FontSet fonts, IconSet icons) {
    if (doctor.experience.isEmpty) {
      return _empty(colors, fonts);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(color: colors.shade0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...doctor.experience.map(
              (exp) {
                return DoctorInfoCardWithType(
                  type: DoctorInfoTypeEnum.experience,
                  date: exp.date ?? '',
                  title: exp.title ?? "",
                  subTitle: exp.description.toList(),
                  image: exp.icon ?? '',
                  certificateSeries: exp.certificateSeries,
                  educationDagre: exp.educationDegree,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationTab(ModelDoctor doctor, CustomColorSet colors, dynamic fonts, dynamic icons) {
    if (doctor.education.isEmpty) {
      return _empty(colors, fonts);
    }

    return DecoratedBox(
      decoration: BoxDecoration(color: colors.shade0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ...doctor.education.map(
                (edu) {
                  return DoctorInfoCardWithType(
                    type: DoctorInfoTypeEnum.education,
                    date: edu.date ?? '',
                    title: edu.title ?? "",
                    subTitle: edu.description.toList(),
                    image: edu.icon ?? '',
                    certificateSeries: edu.certificateSeries,
                    educationDagre: edu.educationDegree,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCardNew extends StatelessWidget {
  const ReviewCardNew({
    super.key,
    required this.name,
    required this.clinicName,
    required this.clinicLocation,
    required this.rating,
    required this.review,
    required this.date,
    required this.clinicImage,
    required this.integratorLogoUrl,
  });

  final String name;
  final String clinicName;
  final String clinicLocation;
  final String integratorLogoUrl;
  final String clinicImage;
  final int rating;
  final String review;
  final String date;

  @override
  Widget build(BuildContext context) {
    final dateTime = MyFunctions.format(date: date, context: context);

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return Container(
          width: 1.sw,
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.4.sw),
                    child: Text(
                      name,
                      maxLines: 2,
                      style: fonts.smallTagSecond.copyWith(fontSize: 14.sp),
                    ),
                  ),
                  if (integratorLogoUrl.isNotEmpty) ...{
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 0.4.sw),
                      child: CommonImage(
                        height: 22.h,
                        imageUrl: integratorLogoUrl,
                      ),
                    ),
                  } else ...{
                    const SizedBox.shrink()
                  }
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.4.sw),
                    child: SizedBox(
                      height: 20,
                      child: GenerateStar(rank: rating, colors: colors, icons: icons),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.4.sw),
                    child: Text(
                      dateTime,
                      style: fonts.xSmallLink.copyWith(fontSize: 12.sp, color: const Color(0xff5F6368)),
                    ),
                  ),
                ],
              ),
              if (clinicName.isNotEmpty || clinicLocation.isNotEmpty) ...{
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Клиника:",
                      style: fonts.xSmallLink.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 36.h,
                        child: Row(
                          spacing: 12.w,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonImage(
                              imageUrl: clinicImage,
                              fit: BoxFit.contain,
                              height: 27,
                              width: 27,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 0.45.sw),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    clinicName,
                                    style: fonts.xSmallLink.copyWith(fontSize: 12),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    clinicLocation,
                                    style: fonts.xSmallLink.copyWith(fontSize: 12, color: const Color(0xff5F6368)),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              },
              Text("comments".tr().replaceAll(":", ""), style: fonts.regularMain),
              Text(
                review,
                style: fonts.xxSmallestText.copyWith(fontSize: 12.sp),
              ),
              1.h.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
