import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hive/hive.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/career/career_page.dart';
import 'package:medion/presentation/pages/others/career/widgets/resume_filling.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/phone_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class VacancySingle extends StatefulWidget {
  const VacancySingle({super.key, required this.vacancy, required this.bloc});

  final VacancyDetailModel vacancy;
  final VacancyBloc bloc;

  @override
  State<VacancySingle> createState() => _VacancySingleState();
}

class _VacancySingleState extends State<VacancySingle> {
  final Completer<YandexMapController> _controller = Completer<YandexMapController>();

  @override
  void initState() {
    widget.bloc.add(VacancyEvent.fetchVacancySingle(id: widget.vacancy.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: ThemeWrapper(
        builder: (context, colors, fonts, icons, controller) {
          return Scaffold(
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
              title: Text("career".tr(), style: fonts.regularMain),
            ),
            resizeToAvoidBottomInset: true,
            backgroundColor: colors.backgroundColor,
            body: BlocConsumer<VacancyBloc, VacancyState>(
              bloc: widget.bloc,
              listener: (context, lState) {
                if (lState.uploadStatus.isSuccess) {
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state.vacancySingleStatus.isFailure) return const SizedBox.shrink();
                if (state.vacancySingleStatus.isInitial || state.vacancySingleStatus.isInProgress) {
                  return const SizedBox.shrink();
                }

                final CameraPosition? kYandexPlex = CameraPosition(
                  target: Point(latitude: state.vacancySingle!.latitude, longitude: state.vacancySingle!.longitude),
                  zoom: 14,
                );
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      1.2.h.verticalSpace,
                      Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                          color: colors.shade0,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 0),
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.vacancy.name, style: fonts.mediumMain),
                              Text(
                                'vacancy_money'.tr(
                                  namedArgs: {
                                    'count': '${state.vacancySingle?.salary}',
                                    'som': '${state.vacancySingle?.currency}',
                                  },
                                ),
                                style: fonts.smallMain,
                              ),
                              Text(
                                'required_experience'.tr(
                                  namedArgs: {
                                    'years': '${state.vacancySingle?.requiredExperienceYear}',
                                  },
                                ),
                                style: fonts.smallLink.copyWith(color: const Color(0xff66686C)),
                              ),
                              Text(
                                "${state.vacancySingle?.workType}",
                                style: fonts.smallLink.copyWith(color: const Color(0xff66686C)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _titleHtmlDesc(
                        title: "you_have_to".tr(),
                        htmlText: state.vacancySingle?.responsibilities ?? '',
                        colors: colors,
                        fonts: fonts,
                      ),
                      _titleHtmlDesc(
                        title: "we_wait_from_you".tr(),
                        htmlText: state.vacancySingle?.requirements ?? '',
                        colors: colors,
                        fonts: fonts,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            "clinic_address".tr(),
                            style: fonts.regularMain,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        height: 200.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: kYandexPlex != null
                              ? YandexMap(
                                  mapObjects: [
                                    PlacemarkMapObject(
                                      mapId: const MapObjectId('branchLocation'),
                                      point: Point(
                                        latitude: state.vacancySingle!.latitude,
                                        longitude: state.vacancySingle!.longitude,
                                      ),
                                      icon: PlacemarkIcon.single(
                                        PlacemarkIconStyle(
                                          image: BitmapDescriptor.fromAssetImage('assets/branch_marker.png'),
                                        ),
                                      ),
                                      text: PlacemarkText(
                                        text: "open_location_clinic".tr(),
                                        style: const PlacemarkTextStyle(),
                                      ),
                                    ),
                                  ],
                                  onMapCreated: (YandexMapController controller) async {
                                    _controller.complete(controller);
                                    await controller.moveCamera(
                                      CameraUpdate.newCameraPosition(kYandexPlex),
                                    );
                                  },
                                  onCameraPositionChanged: (position, reason, finished) {},
                                )
                              : _buildMapPlaceholder(colors),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("how_to_contact_with_us".tr(), style: fonts.regularMain),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 32,
                          children: [
                            _titleAndValue(
                              color: colors,
                              icon: icons.mail.svg(height: 20.h, width: 20.w, color: const Color(0xff808284)),
                              title: "email".tr(),
                              value: "${state.vacancySingle?.email}",
                              fonts: fonts,
                            ),
                            _titleAndValue(
                              color: colors,
                              icon: icons.callCenter.svg(height: 18.h, width: 18.w, color: const Color(0xff808284)),
                              title: "unique_call_center".tr(),
                              value: "${state.vacancySingle?.phone}",
                              fonts: fonts,
                            ),
                            _titleAndValue(
                              color: colors,
                              icon: icons.phone.svg(height: 24.h, width: 24.w, color: const Color(0xff808284)),
                              title: "mobile_call_center".tr(),
                              value: "${state.vacancySingle?.phone}",
                              fonts: fonts,
                            ),
                            CButton(
                              title: "connect_with_us".tr(),
                              onTap: () {
                                makePhoneCall(state.vacancySingle?.phone ?? "");
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      DecoratedBox(
                        decoration: BoxDecoration(color: colors.shade0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                Row(
                                  spacing: 6,
                                  children: [
                                    Expanded(
                                      child: CButton(
                                        title: "reply".tr(),
                                        onTap: () {
                                          _fillingResumeDialog(
                                            title: state.vacancySingle?.name ?? '',
                                            bloc: widget.bloc,
                                            jobId: state.vacancySingle!.id,
                                            companyId: state.vacancySingle!.companyId,
                                          );
                                        },
                                      ),
                                    ),
                                    WScaleAnimation(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF2F2F3),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: SizedBox(
                                          height: 48.h,
                                          width: 48.w,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
                                            child: icons.share.svg(),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        final number = state.vacancySingle?.phone ?? '';
                                        final email = state.vacancySingle?.email ?? '';
                                        final job = state.vacancySingle?.name ?? '';

                                        if (number.isNotEmpty && email.isNotEmpty && job.isNotEmpty) {
                                          shareContactInfo(
                                            number: number,
                                            email: email,
                                            job: job,
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(height: 30.h)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void shareContactInfo({
    required String number,
    required String email,
    required String job,
  }) {
    final buffer = StringBuffer();

    if (number.isNotEmpty) buffer.writeln('📞 Number: $number');
    if (email.isNotEmpty) buffer.writeln('📧 Email: $email');
    if (job.isNotEmpty) buffer.writeln('💼 Job: $job');

    final textToShare = buffer.toString().trim();

    if (textToShare.isNotEmpty) {
      Share.share(textToShare);
    } else {
      debugPrint("No information to share.");
    }
  }

  void _fillingResumeDialog({
    required String title,
    required VacancyBloc bloc,
    required int jobId,
    required int companyId,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white, // or your custom color
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ResumeFilling(
              jobTitle: title,
              hasBack: true,
              bloc: bloc,
              jobId: jobId,
              compId: companyId,
            ),
          ),
        );
      },
    );
  }

  Widget _titleAndValue({
    required String title,
    required String value,
    required FontSet fonts,
    required Widget icon,
    required CustomColorSet color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 6.h,
      children: [
        Text(
          title,
          style: fonts.mediumLink.copyWith(
            fontWeight: FontWeight.w500,
            color: color.darkMode900,
          ),
        ),
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            Text(value, style: fonts.regularLink.copyWith(fontSize: 18)),
          ],
        ),
      ],
    );
  }

  Widget _buildMapPlaceholder(colors) {
    return Container(
      color: colors.neutral200,
      child: Center(
        child: Icon(
          Icons.map_outlined,
          color: colors.neutral500,
          size: 40.w,
        ),
      ),
    );
  }

  Widget _titleHtmlDesc({
    required String title,
    required String htmlText,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: Text(title, style: fonts.regularMain),
              ),
              WHtml(
                data: htmlText,
                backgroundColor: colors.shade0,
                margin: Margins.symmetric(horizontal: 4.w, vertical: 2.h).copyWith(bottom: Margin(0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
