import 'dart:developer';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/doctors/doctors_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/doctor_discount.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/error_progress_ui.dart';
import 'package:medion/presentation/pages/home/doctors/inner_page/video_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/about_doctor_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_shimmer.dart';
import 'package:medion/presentation/pages/others/branches/widget/image_dialog.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/customer_review/review_card.dart';
import 'package:medion/presentation/pages/others/dicsount/discount_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/doctor_info_enum.dart';
import 'package:medion/utils/enums/feedback_status_enum.dart';

class DoctorsInfo {
  final String title;
  final bool canSee;
  final GlobalKey itemKey;
  final DoctorInfoEnum checker;

  const DoctorsInfo({
    required this.canSee,
    required this.title,
    required this.itemKey,
    required this.checker,
  });
}

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
          alignment: 0.1,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: AboutDoctorWidget(
                              doctorID: widget.id,
                              name: widget.name,
                              profession: widget.profession,
                              specialty: widget.status,
                              image: widget.image,
                            ),
                          ),
                          CustomTabbarBlack(
                            tabs: state.doctorInfoItems.where((e) => e.canSee).map((e) => e.title.tr()).toList(),
                            onTap: (val) {
                              tabForScrollSection(val, state.doctorInfoItems);
                            },
                            padding: EdgeInsets.only(right: 12.w),
                            labelPadding: EdgeInsets.only(right: 16.w, left: 12),
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
                              state.doctorInfoItems.where((elem) => elem.canSee).toList().length + 1,
                              (index) {
                                final item = state.doctorInfoItems[index];
                                final doctor = state.doctorDetails!;
                                return Column(
                                  key: item.itemKey,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (item.checker.isAbout && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            child: Text(
                                              item.title.tr(),
                                              textAlign: TextAlign.left,
                                              style: fonts.regularMain,
                                            ),
                                          ),
                                          about(context: context, colors: colors, doctor: doctor)
                                        ],
                                      )
                                    },
                                    if (item.checker.isDiscount && item.canSee) ...{
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            child: Text(
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
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      _buildExperienceTab(doctor, colors, fonts, icons),
                                    },
                                    if (item.checker.isEducation && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      _buildEducationTab(doctor, colors, fonts, icons),
                                    },
                                    if (item.checker.isWorkTime && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      _buildWorkingHoursTab(doctor, colors, fonts),
                                    },
                                    if (item.checker.isAchievements && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      _achievements(
                                        awards: doctor.award.toList(),
                                        colors: colors,
                                        fonts: fonts,
                                      ),
                                    },
                                    if (item.checker.isGallery && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      GalleryItemWidget(gallery: doctor.galleryItems.toList())
                                    },
                                    if (item.checker.isReviews && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      _reviews(
                                        reviews: doctor.reviews.toList(),
                                        colors: colors,
                                        fonts: fonts,
                                        icons: icons,
                                      ),
                                    },
                                    if (item.checker.isArticles && item.canSee) ...{
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(item.title.tr(), style: fonts.regularMain),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: _articles(
                                          articles: doctor.articles.toList(),
                                          colors: colors,
                                          fonts: fonts,
                                        ),
                                      )
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
    return SizedBox(
      height: 118,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8,
          children: [
            ...List.generate(
              reviews.length,
              (i) {
                final item = reviews[i];
                return ReviewCard(
                  review: GetReviewModel((b) => b
                        ..ratings = "${item.ratings.length}"
                        ..review = item.review
                      // name: "user name",
                      // description: item.review,
                      // rating: item.ratings.length,
                      ),
                  colors: colors,
                  icons: icons,
                  fonts: fonts,
                  status: FeedBackStatus.none,
                );
              },
            ),
          ],
        ),
      ),
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
                              discountCondition: "",
                              date: '',
                              imagePath: [...item.images, item.primaryImage],
                              title: item.title,
                              desc: item.description,
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
    required List<Award> awards,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    if (awards.isEmpty) {
      return _empty(colors, fonts);
    }
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...List.generate(
          awards.length,
          (index) {
            final item = awards[index];
            return Container(
              margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, index != awards.length - 1 ? 8.h : 0),
              width: 1.sw,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title ?? '', style: fonts.regularMain),
                  Text(item.date ?? "", style: fonts.xSmallMain),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget about({required BuildContext context, required CustomColorSet colors, required ModelDoctor doctor}) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      width: 1.sw,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: colors.shade0, borderRadius: BorderRadius.circular(12)),
      child: Text(doctor.decodedDescription),
    );
  }

  Widget discount({
    required BuildContext context,
    required CustomColorSet colors,
    required FontSet fonts,
    required ModelDoctor doctor,
  }) {
    if (doctor.hasDiscount && doctor.discount.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8,
          children: [
            ...List.generate(
              doctor.discount.length + 1,
              (i) {
                if (i == 0) return const SizedBox(width: 12);
                final item = doctor.discount[i - 1];
                return SizedBox(
                  width: 163.w,
                  height: 255.h,
                  child: DiscountCard(
                    title: item.title ?? "",
                    image: item.image ?? "",
                    date: _formatDiscountDate(item.discountEndDate),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => DoctorDiscountScreen(discount: item, doctor: doctor)),
                      );
                    },
                    colors: colors,
                    fonts: fonts,
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

  Widget _buildExperienceTab(ModelDoctor doctor, dynamic colors, dynamic fonts, dynamic icons) {
    if (doctor.experience.isEmpty) {
      return _empty(colors, fonts);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: doctor.experience.map((exp) {
          final dateParts = exp.date.toString().split(" - ");
          final startDate = DateTime.parse(dateParts[0]);
          final formattedStartDate = DateFormat('d MMM yyyy').format(startDate);

          final endDate = dateParts.length > 1 && dateParts[1] == 'current'
              ? 'current'
              : DateFormat('d MMM yyyy').format(DateTime.parse(dateParts[1]));

          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.title.toString(),
                    style: fonts.xSmallText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('- $formattedStartDate - $endDate', style: fonts.xSmallText),
                  if (exp.description.toString().isNotEmpty) ...[
                    Text(exp.description.toString(), style: fonts.xSmallText),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEducationTab(ModelDoctor doctor, dynamic colors, dynamic fonts, dynamic icons) {
    if (doctor.education.isEmpty) {
      return _empty(colors, fonts);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: doctor.education.map((edu) {
          final dateParts = edu.date.toString().split(" - ");
          final startDate = DateTime.parse(dateParts[0]);
          final formattedStartDate = DateFormat('d MMM yyyy').format(startDate);

          final endDate = dateParts.length > 1 && dateParts[1] == 'current'
              ? 'current'
              : DateFormat('d MMM yyyy').format(DateTime.parse(dateParts[1]));

          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Container(
              padding: EdgeInsets.all(8.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.shade0,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    edu.title.toString(),
                    style: fonts.xSmallLink.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '- $formattedStartDate - $endDate',
                    style: fonts.xSmallLink,
                  ),
                  if (edu.description.toString().isNotEmpty) ...{
                    Text(
                      edu.description.toString(),
                      style: fonts.xSmallLink,
                    ),
                  }
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWorkingHoursTab(ModelDoctor doctor, dynamic colors, dynamic fonts) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((doctor.workSchedule.monday.isNotEmpty ||
              doctor.workSchedule.tuesday.isNotEmpty ||
              doctor.workSchedule.wednesday.isNotEmpty ||
              doctor.workSchedule.thursday.isNotEmpty ||
              doctor.workSchedule.friday.isNotEmpty ||
              doctor.workSchedule.saturday.isNotEmpty)) ...[
            _buildSchedule(doctor.workSchedule, colors, fonts)
          ] else ...[
            const SizedBox.shrink()
          ],
        ],
      ),
    );
  }

  Widget _buildSchedule(WorkSchedule schedule, dynamic colors, dynamic fonts) {
    final days = [
      {'day': 'monday'.tr(), 'schedules': schedule.monday},
      {'day': 'tuesday'.tr(), 'schedules': schedule.tuesday},
      {'day': 'wednesday'.tr(), 'schedules': schedule.wednesday},
      {'day': 'thursday'.tr(), 'schedules': schedule.thursday},
      {'day': 'friday'.tr(), 'schedules': schedule.friday},
      {'day': 'saturday'.tr(), 'schedules': schedule.saturday},
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: colors.shade0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: days.map((day) {
            final dayName = day['day'] as String;
            final schedules = day['schedules'] as BuiltList<ScheduleItem>;

            if (schedules.isEmpty) return const SizedBox.shrink();

            return Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFFF9F9F9),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayName,
                      style: fonts.mediumMain.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: colors.primary900,
                      ),
                    ),
                    ...schedules.map(
                      (item) {
                        return Text(
                          item.time.toString(),
                          style: fonts.regularMain.copyWith(color: colors.neutral600, fontSize: 13.sp),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class GalleryItemWidget extends StatefulWidget {
  const GalleryItemWidget({
    super.key,
    required this.gallery,
  });

  final List<GalleryItems> gallery;

  @override
  State<GalleryItemWidget> createState() => _GalleryItemWidgetState();
}

class _GalleryItemWidgetState extends State<GalleryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        if (widget.gallery.isEmpty) {
          return _empty(colors, fonts);
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors.shade0,
          ),
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          height: 160.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: [
                ...List.generate(
                  widget.gallery.length,
                  (i) {
                    final item = widget.gallery.reversed.toList()[i];
                    bool hasVideo = item.type == "video";

                    return WScaleAnimation(
                      onTap: () {
                        final List<ContentBase> contentBaseList = [
                          ...widget.gallery.where((item) => item.fileUrl.isNotEmpty).map((item) => ContentBase(
                                isVideo: item.type.toLowerCase() == 'video',
                                fileLink: item.type.toLowerCase() == 'video'
                                    ? "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4"
                                    : item.fileUrl,
                                coverImage: item.videoImage,
                              ))
                        ];

                        final List<ContentBase> images = [...contentBaseList];
                        MyFunctions.showImages(
                          isVideo: hasVideo,
                          context: context,
                          mainImage: item.fileUrl,
                          images: [...images],
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              width: 0.75.sw,
                              height: double.infinity,
                              margin: EdgeInsets.fromLTRB(
                                i == 0 ? 10 : 0,
                                8.h,
                                i == widget.gallery.length - 1 ? 10 : 0,
                                8.h,
                              ),
                              decoration: BoxDecoration(
                                color: colors.neutral200,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.4),
                              child: CommonImage(
                                radius: BorderRadius.circular(6.r),
                                imageUrl: hasVideo ? item.videoImage : item.fileUrl,
                              ),
                            ),
                          ),
                          if (hasVideo) ...{
                            Center(
                              child: SizedBox(
                                height: 36.h,
                                width: 36.w,
                                child: icons.playButton.svg(),
                              ),
                            ),
                          }
                        ],
                      ),
                    );

                    // if (hasVideo) {
                    //   return VideoWidget(
                    //     videos: [...videos],
                    //     image: item.videoImage,
                    //     videoUrl: item.fileUrl,
                    //     // videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                    //   );
                    // } else {
                    //
                    // }
                  },
                ),
              ],
            ),
          ),
        );
      },
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
}
