import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_small_container.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsDataWidget extends StatefulWidget {
  final String type;

  const ResultsDataWidget({super.key, required this.type});

  @override
  State<ResultsDataWidget> createState() => _ResultsDataWidgetState();
}

class _ResultsDataWidgetState extends State<ResultsDataWidget> {
  List<dynamic> documents = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchDocuments();
  }

  Future<void> _fetchDocuments() async {
    try {
      final token = (await DBService.create).token.accessToken;
      if (token == null) {
        throw Exception('No access token available');
      }

      final response = await http.get(
        Uri.parse(
            'https://his.uicgroup.tech/apiweb/profile/patient_analysis_mobile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          switch (widget.type) {
            case 'lis':
              documents = data['emr_docs_lis'] ?? [];
              break;
            case 'fis':
              documents = data['emr_docs_fis'] ?? [];
              break;
            case 'ris':
              documents = data['emr_docs_ris'] ?? [];
              break;
            case 'consultation':
              documents = data['emr_docs_consultation'] ?? [];
              break;
            default:
              documents = [];
          }
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Failed to load documents: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error fetching documents: $e';
        isLoading = false;
      });
    }
  }

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
      final fileName =
          'Document_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.pdf';
      final filePath = '${directory.path}/$fileName';

      final dio = Dio();

      final dialogContextCompleter = Completer<BuildContext>();

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

      final result = await OpenFile.open(filePath);

      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('failed_to_open_file'.tr())),
        );
      }
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
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error != null) {
          return Center(
            child: Text(
              error!,
              style: fonts.smallText.copyWith(color: colors.error500),
            ),
          );
        }

        if (documents.isEmpty) {
          return Center(
            child: Text(
              'Нет данных для отображения',
              style: fonts.smallText.copyWith(color: colors.neutral600),
            ),
          );
        }

        return ListView.builder(
          itemCount: documents.length,
          padding: EdgeInsets.all(16.w),
          itemBuilder: (context, index) {
            final document = documents[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: colors.shade0,
              ),
              child: AnimationButtonEffect(
                onTap: () {
                  context.read<BottomNavBarController>().changeNavBar(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentWebView(
                        url: document['document_url'] ?? "",
                      ),
                    ),
                  ).then((_) {
                    context.read<BottomNavBarController>().changeNavBar(false);
                  });
                },
                child: ListTile(
                  title: Text(
                    document['document_name'] ?? "Без названия",
                    style: fonts.smallSemLink,
                  ),
                  subtitle: Text(
                    _formatDate(context, document['date']),
                    style: fonts.xSmallText.copyWith(color: colors.neutral600),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CSmallContainer(
                        icon: icons.download,
                        onTap: () async {
                          if (document['document_url'] != null) {
                            await downloadPdf(document['document_url'])
                                .then((_) {
                              Navigator.of(context, rootNavigator: true).pop();
                            });
                          }
                        },
                        color: colors.neutral200,
                      ),
                      8.w.horizontalSpace,
                      CSmallContainer(
                        icon: icons.link,
                        onTap: () {
                          Share.share(
                            document['document_url']!,
                            subject:
                                document['document_name'] ?? 'Medical document',
                          );
                        },
                        color: colors.neutral200,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть ссылку')),
      );
    }
  }
}
