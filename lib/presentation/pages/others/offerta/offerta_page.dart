import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html; // Alias flutter_html
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:http/http.dart' as http;
import 'package:medion/utils/constants.dart';
import 'package:medion/utils/helpers/decode_html.dart';

class OffertaPage extends StatefulWidget {
  const OffertaPage({super.key});

  @override
  State<OffertaPage> createState() => _OffertaPageState();
}

class _OffertaPageState extends State<OffertaPage> {
  String _offertaText = '';
  String _companyName = '';
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchOffertaData();
  }

  Future<void> _fetchOffertaData() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseUrlP}/company/offerta'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));

        setState(() {
          _offertaText = jsonData['offerta'] ?? '';
          _companyName = decodeHtml(jsonData['companyName'] ?? '');
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching data: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "offerta".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: colors.error500,
                    ))
                  : _errorMessage.isNotEmpty
                      ? Center(child: Text(_errorMessage))
                      : SingleChildScrollView(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            children: [
                              if (_companyName.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Text(
                                    _companyName,
                                    style: fonts.regularLink?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              html.Html(
                                data: _offertaText,
                                style: {
                                  "body": html.Style(
                                    fontSize: html.FontSize(14.sp),
                                    color: Colors.black,
                                  ),
                                  "b": html.Style(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  "i": html.Style(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  "li": html.Style(
                                    margin: html.Margins.only(bottom: 8.h),
                                  ),
                                },
                                onLinkTap: (url, _, __) {
                                  if (url != null) {}
                                },
                              ),
                            ],
                          ),
                        ),
            ),
          ],
        ),
      );
    });
  }
}
