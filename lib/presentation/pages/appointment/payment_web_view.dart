import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/payment_provider.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:intl/intl.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  const PaymentWebView({super.key, required this.url});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  bool _showWebView = false;
  late WebViewController _webViewController;

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
    _openPaymentWebView(widget.url); // Open the URL once WebView is initialized
  }

  void _openPaymentWebView(String url) {
    _webViewController.loadRequest(Uri.parse(url));
    setState(() {
      _showWebView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      if (_showWebView) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: colors.shade0,
            body: Stack(
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
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
    });
  }
}
