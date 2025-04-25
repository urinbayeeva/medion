import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medion/utils/helpers/decode_html.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String? privacyContent; // Variable to hold the fetched privacy policy text
  bool isLoading = true; // Variable to track loading state
  String? errorMessage; // Variable to hold error message if any

  @override
  void initState() {
    super.initState();
    _fetchPrivacyPolicy(); // Fetch privacy policy when the page loads
  }

  // Function to fetch privacy policy data from the API
  Future<void> _fetchPrivacyPolicy() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://his.uicgroup.tech/apiweb/company/privacy?lang=en_US'),
        headers: {'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Ensure correct UTF-8 decoding
        final responseBody = utf8.decode(response.bodyBytes);

        // Now parse the JSON content
        final data = json.decode(responseBody);
        setState(() {
          privacyContent = data['privacy']; // Store the privacy content
          isLoading = false; // Data is fetched, stop loading
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load privacy policy'; // Set error message
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage =
            'Error fetching privacy policy: $e'; // Handle error fetching
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.shade0,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CAppBar(
              title: "",
              isBack: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  Text(
                    "privacy_policy".tr(),
                    style: fonts.displaySecond,
                  ),
                  SizedBox(height: 20.h),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: colors.error500,
                        ))
                      : errorMessage != null
                          ? Center(
                              child: Text(
                                errorMessage!,
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            )
                          : Text(
                              decodeHtml(privacyContent ?? ''),
                              style: TextStyle(fontSize: 16.sp),
                            ), // Display privacy content or error message
                  34.h.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
