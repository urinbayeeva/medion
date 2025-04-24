import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/styles/style.dart';
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
  bool _isOpeningPdf = false;

  @override
  void initState() {
    super.initState();
    _initializePaymentUrl();
  }

  Future<void> _initializePaymentUrl() async {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: _handleError,
          onNavigationRequest: (NavigationRequest request) {
            if (!(request.url.startsWith('https://') ||
                request.url.startsWith('http://'))) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    setState(() {
      _showWebView = true;
    });
  }

  void _handleError(WebResourceError error) {
    // Handle web resource errors here
    print('WebView error: ${error.description}');
  }

  Future<void> downloadPdf(String url) async {
    try {
      print("Starting PDF download...");
      setState(() {
        _isDownloading = true;
        _downloadProgress = 0;
        _showDownloadDialog = true;
      });

      final status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission required'.tr())),
        );
        setState(() {
          _isDownloading = false;
          _showDownloadDialog = false;
        });
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      final fileName =
          'Invoice_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.pdf';
      final filePath = '${directory.path}/$fileName';

      final dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = received / total;
              print("Download progress: ${_downloadProgress * 100}%");
            });
          }
        },
      );

      print("Download completed, opening file...");
      setState(() {
        _showDownloadDialog = false;
        _isOpeningPdf = true;
      });

      final result = await OpenFile.open(filePath);

      setState(() {
        _isOpeningPdf = false;
      });

      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('failed_to_open_file'.tr())),
        );
      }
    } catch (e) {
      print("Error during download: $e");
      setState(() {
        _showDownloadDialog = false;
        _isOpeningPdf = false;
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
    return AlertDialog(
      backgroundColor: Colors.white,
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
          CircularProgressIndicator(
            value: _downloadProgress,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(
              Style.error500, // Fallback color
            ),
            strokeWidth: 6.w,
          ),
          SizedBox(height: 16.h),
          Text(
            '${(_downloadProgress * 100).toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'please_wait'.tr(),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isDownloading
              ? null
              : () {
                  Navigator.of(context).pop();
                  setState(() {
                    _showDownloadDialog = false;
                  });
                },
          child: Text('cancel'.tr()),
        ),
      ],
    );
  }

  Widget _buildOpeningDialog() {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'opening_pdf'.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),
          CircularProgressIndicator(
            strokeWidth: 6.w,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Style.error500, // Fallback color
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'please_wait'.tr(),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
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
                            onTap: () => downloadPdf(widget.url),
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
              if (_showDownloadDialog)
                Center(
                  child: _buildDownloadDialog(),
                ),
              if (_isOpeningPdf)
                Center(
                  child: _buildOpeningDialog(),
                ),
            ],
          ),
        ),
      );
    });
  }
}
