import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/download_button.dart';
import 'package:medion/presentation/pages/visits/widgets/order_card_w.dart';
import 'package:medion/presentation/styles/theme.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.docUrls, required this.icons, required this.colors, required this.fonts});

  final List<PatientAnalysis> docUrls;
  final IconSet icons;
  final CustomColorSet colors;
  final FontSet fonts;

  @override
  Widget build(BuildContext context) {
    if (docUrls.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            icons.emojiSad.svg(width: 66, height: 66),
            Text("no_result_found".tr(), style: fonts.regularMain),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 50),
      child: ListView.builder(
        itemCount: docUrls.length,
        itemBuilder: (context, index) {
          final last = (docUrls.length - 1) != index;
          return Container(
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: !last ? const BorderRadius.vertical(bottom: Radius.circular(12)) : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                  child: Row(
                    spacing: 8,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(docUrls[index].documentName ?? '', style: fonts.smallTagSecond),
                          Text(docUrls[index].date ?? '', style: fonts.xSmallText.copyWith(color: colors.neutral600)),
                        ],
                      ),
                      const Spacer(),
                      DecoratedBox(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: colors.neutral50),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: icons.share.svg(height: 20.h, width: 20.w),
                        ),
                      ),
                      DownloadButton(onTap: () => MyFunctions.openLink(docUrls[index].documentUrl ?? '')),
                    ],
                  ),
                ),
                if (last) const Divider() else SizedBox(height: 8.h)
              ],
            ),
          );
        },
      ),
    );
  }
}
