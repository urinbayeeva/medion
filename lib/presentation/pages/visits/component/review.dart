import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/pages/others/feedbacks/feedback_view.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key, required this.branch});

  final String branch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 50.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: FeedbackView(noBack: true, branch: branch)),
        ],
      ),
    );
  }
}
