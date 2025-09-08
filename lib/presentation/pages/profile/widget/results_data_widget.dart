import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_small_container.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsDataWidget extends StatefulWidget {
  final String type;
  final List<PatientAnalysis> items;

  const ResultsDataWidget({super.key, required this.type, required this.items});

  @override
  State<ResultsDataWidget> createState() => _ResultsDataWidgetState();
}

class _ResultsDataWidgetState extends State<ResultsDataWidget> {
  Future<void> downloadPdf(String url) async {
    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('storage_permission_required'.tr())),
        );
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'Document_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.pdf';
      final filePath = '${directory.path}/$fileName';

      final dio = Dio();

      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return _buildDownloadDialog();
        },
      );

      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {});
          }
        },
      );

      await OpenFile.open(filePath).then((e) {
        Navigator.of(context).pop();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('download_failed'.tr())),
      );
    }
  }

  Widget _buildDownloadDialog() {
    return AlertDialog(
      backgroundColor: Style.background,
      contentPadding: EdgeInsets.all(24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'downloading_pdf'.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          const CircularProgressIndicator(
            strokeWidth: 6,
            valueColor: AlwaysStoppedAnimation<Color>(Style.error500),
          ),
          SizedBox(height: 16.h),
          Text(
            'please_wait'.tr(),
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _formatDate(BuildContext context, String dateString) {
    final date = DateTime.parse(dateString);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final formatter = DateFormat('E, d MMMM yyyy', locale);
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        if (widget.items.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 130.h),
              child: EmptyState(title: "no_results_found".tr()),
            ),
          );
        }

        return ListView.separated(
          itemCount: widget.items.length,
          padding: EdgeInsets.all(16.w),
          separatorBuilder: (context, index) => 10.h.verticalSpace,
          itemBuilder: (context, index) {
            final document = widget.items[index];
            return ResultCard(
              share: () {
                Map<String, dynamic> data = {
                  "File url": "${document.documentUrl}",
                  "File Name": "${document.doctorName}",
                };
                MyFunctions.shareData(data);
              },
              download: () {
                if (document.documentUrl != null && document.documentUrl!.isNotEmpty) {
                  downloadPdf(document.documentUrl!);
                } else {
                  context.showPopUp(
                    status: PopUpStatus.warning,
                    message: "url_not_valid".tr(),
                    fonts: fonts,
                    colors: colors,
                    context: context,
                  );
                }
              },
              service: document.documentName ?? "service",
              doctorName: document.doctorName ?? "doctorName",
              doctorImage: document.doctorImage ?? "doctorImage",
              clinicName: document.clinicName ?? "clinicName",
              clinicImage: document.clinicImage ?? "",
              date: _formatDate(context, document.date ?? DateTime.now().toString()),
              url: document.documentUrl ?? "url",
            );
          },
        );
      },
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.service,
    required this.doctorName,
    required this.doctorImage,
    required this.clinicImage,
    required this.clinicName,
    required this.date,
    required this.url,
    required this.download,
    required this.share,
  });

  final String service;
  final String doctorName;
  final String doctorImage;
  final String clinicImage;
  final String clinicName;
  final String date;
  final String url;
  final VoidCallback download;
  final VoidCallback share;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        width: 1.sw,
        height: 195.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rowWidget(
              title: "service".tr(),
              action: Text(
                service,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fonts.xSmallLink.copyWith(fontSize: 12),
              ),
              fonts: fonts,
            ),
            rowWidget(
              title: "doctor".tr(),
              action: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.w,
                children: [
                  Text(
                    doctorName,
                    maxLines: 2,
                    style: fonts.xSmallLink.copyWith(fontSize: 12),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.neutral200.withValues(alpha: 0.2),
                    ),
                    child: CommonImage(
                      radius: BorderRadius.circular(99.r),
                      fit: BoxFit.contain,
                      height: 28.h,
                      width: 28.w,
                      imageUrl: doctorImage,
                    ),
                  ),
                ],
              ),
              fonts: fonts,
            ),
            rowWidget(
              title: "Клиника",
              action: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.w,
                children: [
                  Text(
                    clinicName,
                    maxLines: 2,
                    style: fonts.xSmallLink.copyWith(fontSize: 12),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.neutral200.withValues(alpha: 0.2),
                    ),
                    child: CommonImage(
                      radius: BorderRadius.circular(99.r),
                      height: 28.h,
                      width: 28.w,
                      fit: BoxFit.contain,
                      imageUrl: clinicImage,
                    ),
                  ),
                ],
              ),
              fonts: fonts,
            ),
            rowWidget(
              title: "Дата и время:",
              action: Text(
                date,
                maxLines: 1,
                style: fonts.xSmallLink.copyWith(fontSize: 12),
              ),
              fonts: fonts,
            ),
            Row(
              spacing: 12.w,
              children: [
                Expanded(
                  child: CButton(
                    height: 36.h,
                    backgroundColor: const Color(0xffF2F2F3),
                    title: '',
                    onTap: download,
                    child: Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icons.download.svg(),
                        Text(
                          "download_pdf".tr(),
                          style: fonts.xSmallLink,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CButton(
                    height: 36.h,
                    backgroundColor: const Color(0xffF2F2F3),
                    title: '',
                    onTap: share,
                    child: Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icons.share.svg(),
                        Text(
                          "share".tr(),
                          style: fonts.xSmallLink,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  Widget rowWidget({
    required String title,
    required Widget action,
    required FontSet fonts,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        spacing: 12.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: fonts.xSmallLink.copyWith(
              fontSize: 12,
              color: const Color(0xff80868B),
            ),
          ),
          Flexible(child: action)
        ],
      ),
    );
  }
}
