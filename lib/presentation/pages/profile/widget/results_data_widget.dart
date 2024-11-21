import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/presentation/component/c_small_container.dart';
import 'package:medion/presentation/pages/profile/widget/results_data.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ResultsDataWidget extends StatelessWidget {
  const ResultsDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return resultsData.isEmpty
          ? Center(
              child: Text(
                'Нет данных для отображения',
                style: fonts.smallText.copyWith(color: colors.neutral600),
              ),
            )
          : ListView.builder(
              itemCount: resultsData.length,
              padding: EdgeInsets.all(16.w),
              itemBuilder: (context, item) {
                final data = resultsData[item];
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: colors.shade0,
                  ),
                  child: ListTile(
                    title:
                        Text(data['result_name']!, style: fonts.smallSemLink),
                    subtitle: Text(data['date']!,
                        style: fonts.xSmallText
                            .copyWith(color: colors.neutral600)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CSmallContainer(
                          icon: icons.download,
                          onTap: () async {
                            final fileDownloadService = FileDownloadService();
                            await fileDownloadService.downloadPDFWithProgress(
                              context,
                              data['link'], // Replace with your file URL
                              "sample.pdf", // Desired file name
                              colors.error500, // Background color for progressf
                              colors
                                  .shade0, // Foreground color for text and indicator
                            );
                          },
                          color: colors.neutral200,
                        ),
                        8.w.horizontalSpace,
                        CSmallContainer(
                          icon: icons.link,
                          onTap: () {},
                          color: colors.neutral200,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
