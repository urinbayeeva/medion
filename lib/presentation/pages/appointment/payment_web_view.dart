import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:intl/intl.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final bool isInvoice;
  const PaymentWebView({
    super.key,
    required this.url,
    this.isInvoice = false,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  bool _showWebView = false;
  late WebViewController _webViewController;
  bool _isDownloading = false;
  double _downloadProgress = 0;
  bool _showDownloadDialog = false;

  @override
  void initState() {
    super.initState();
    _initializePaymentUrl();
  }

  Future<void> _initializePaymentUrl() async {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );
    _openPaymentWebView(widget.url);
  }

  void _openPaymentWebView(String url) {
    _webViewController.loadRequest(Uri.parse(url));
    setState(() {
      _showWebView = true;
    });
  }

  Future<void> _downloadPdf(String url) async {
    try {
      setState(() {
        _isDownloading = true;
        _downloadProgress = 0;
        _showDownloadDialog = true;
      });

      final status = await Permission.storage.request();
      if (!status.isGranted) {
        throw Exception('Storage permission denied');
      }

      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'Invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final filePath = '${directory.path}/$fileName';

      final dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = received / total;
            });
          }
        },
      );

      setState(() {
        _showDownloadDialog = false;
      });

      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('failed_to_open_file'.tr())),
        );
      }
    } catch (e) {
      setState(() {
        _showDownloadDialog = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('download_failed'.tr())),
      );
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  Widget _buildDownloadDialog() {
    return CupertinoAlertDialog(
      title: Text('downloading_pdf'.tr()),
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoActivityIndicator(
              radius: 16.r,
            ),
            SizedBox(height: 24.h),
            Text(
              '${(_downloadProgress * 100).toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 4.h,
              child: LinearProgressIndicator(
                value: _downloadProgress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  CupertinoColors.activeBlue,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('cancel'.tr()),
          onPressed: _isDownloading
              ? null
              : () {
                  Navigator.of(context).pop();
                },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: colors.shade0,
          body: Stack(
            children: [
              if (_showWebView)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 34.h),
                      child: WebViewWidget(controller: _webViewController),
                    ),
                    Positioned(
                      top: -10.h,
                      right: 16.w,
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: colors.neutral200,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 20.w,
                            color: colors.primary900,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    if (widget.isInvoice)
                      Positioned(
                        bottom: 20.h,
                        right: 0.w,
                        left: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CButton(
                            title: "download_pdf".tr(),
                            onTap: () => _downloadPdf(widget.url),
                          ),
                        ),
                      ),
                  ],
                )
              else
                Center(
                  child: CircularProgressIndicator(
                    color: colors.primary500,
                  ),
                ),
              if (_showDownloadDialog) _buildDownloadDialog(),
            ],
          ),
        ),
      );
    });
  }
}
