import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medion/utils/constants.dart';

class RecommendationsWidget extends StatefulWidget {
  const RecommendationsWidget({super.key});

  @override
  State<RecommendationsWidget> createState() => _RecommendationsWidgetState();
}

class _RecommendationsWidgetState extends State<RecommendationsWidget> {
  List<dynamic> recommendations = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchRecommendations();
  }

  Future<void> _fetchRecommendations() async {
    try {
      final token = (await DBService.create).token.accessToken;
      if (token == null) {
        throw Exception('No access token available');
      }

      final response = await http.get(
        Uri.parse('${Constants.baseUrlP}/profile/recommendations'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          recommendations = data;
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'recommendations_error'.tr();
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'recommendations_error'.tr();
        isLoading = false;
      });
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty)
      return 'recommendations_not_scheduled'.tr();
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('EEE, MMM d, y').format(date);
    } catch (e) {
      return dateString;
    }
  }

  String _formatTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return '';
    try {
      return DateFormat('h:mm a').format(DateFormat('HH:mm').parse(timeString));
    } catch (e) {
      return timeString;
    }
  }

  String _formatPrice(double price) {
    return NumberFormat.currency(locale: 'en_US', symbol: '').format(price);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
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

      if (recommendations.isEmpty) {
        return Center(
          child: Text(
            'recommendations_empty'.tr(),
            style: fonts.smallText.copyWith(color: colors.neutral600),
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final recommendation = recommendations[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              collapsedBackgroundColor: colors.shade0,
              backgroundColor: colors.shade0,
              title: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                title: Text(
                  recommendation['service'] ??
                      'recommendations_no_service'.tr(),
                  style: fonts.smallSemLink,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Text(
                      '${'recommendations_created_date'.tr()} ${_formatDate(recommendation['created_on'])}',
                      style:
                          fonts.xSmallText.copyWith(color: colors.neutral600),
                    ),
                    if (recommendation['scheduled_date'] != null)
                      Text(
                        '${'recommendations_scheduled_date'.tr()} ${_formatDate(recommendation['scheduled_date'])}',
                        style:
                            fonts.xSmallText.copyWith(color: colors.neutral600),
                      ),
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: recommendation['payment_state'] == 'paid'
                        ? colors.success100
                        : colors.error100,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    recommendation['payment_state'] == 'paid'
                        ? 'recommendations_paid'.tr()
                        : 'recommendations_not_paid'.tr(),
                    style: fonts.xSmallText.copyWith(
                      color: recommendation['payment_state'] == 'paid'
                          ? colors.success500
                          : colors.error500,
                    ),
                  ),
                ),
              ),
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Card(
                    color: colors.shade0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow(
                            'recommendations_created_date'.tr(),
                            _formatDate(recommendation['created_on']),
                            colors,
                            fonts,
                          ),
                          if (recommendation['scheduled_date'] != null) ...[
                            _buildDetailRow(
                              'recommendations_scheduled_date'.tr(),
                              _formatDate(recommendation['scheduled_date']),
                              colors,
                              fonts,
                            ),
                            _buildDetailRow(
                              'recommendations_time'.tr(),
                              _formatTime(recommendation['start_time']),
                              colors,
                              fonts,
                            ),
                          ],
                          _buildDetailRow(
                            'recommendations_status'.tr(),
                            recommendation['is_done']
                                ? 'recommendations_completed'.tr()
                                : 'recommendations_pending'.tr(),
                            colors,
                            fonts,
                          ),
                          _buildDetailRow(
                            'recommendations_price'.tr(),
                            'sum'.tr(namedArgs: {
                              "amount": _formatPrice(
                                  recommendation['actual_price'] ?? 0)
                            }),
                            colors,
                            fonts,
                          ),
                          _buildDetailRow(
                            'recommendations_total'.tr(),
                            'sum'.tr(namedArgs: {
                              "amount":
                                  _formatPrice(recommendation['total'] ?? 0)
                            }),
                            colors,
                            fonts,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildDetailRow(String label, String value, colors, fonts) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: fonts.xSmallText.copyWith(
                color: colors.neutral600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: fonts.xSmallText.copyWith(color: colors.neutral800),
            ),
          ),
        ],
      ),
    );
  }
}
