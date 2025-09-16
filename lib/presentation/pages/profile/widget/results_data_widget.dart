import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/profile/widget/result_card.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
              service: document.documentName ?? "",
              doctorName: document.doctorName ?? "",
              doctorImage: document.doctorImage ?? "",
              clinicName: document.clinicName ?? "",
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
