import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
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
  const PaymentWebView({super.key, required this.url, this.isInvoice = false});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  bool _showWebView = false;
  late WebViewController _webViewController;
  bool _isDownloading = false;
  double _downloadProgress = 0;

  @override
  void initState() {
    super.initState();
    _initializePaymentUrl();
  }

  Future<void> _initializePaymentUrl() async {
    // Initialize WebView controller
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
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        throw Exception('Storage permission denied');
      }

      // 2. Get download directory
      final directory = await getApplicationDocumentsDirectory();
      final fileName = url.split('/').last;
      final filePath = '${directory.path}/$fileName';

      // 3. Download the file
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloading PDF...')),
      );

      final dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).toStringAsFixed(0);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Downloading: $progress%')),
            );
          }
        },
      );

      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to open file: ${result.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: colors.shade0,
          body: _showWebView
              ? Stack(
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
                      if (widget.isInvoice)
                        Positioned(
                          bottom: 20.h,
                          right: 0.w,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: CButton(
                              title: "download_pdf".tr(),
                              onTap: () =>
                                  _downloadPdf(widget.url), // Pass the PDF URL
                            ),
                          ),
                        ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: colors.primary500,
                  ),
                ),
        ),
      );
    });
  }
}
