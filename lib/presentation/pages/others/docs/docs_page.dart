import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DocsPage extends StatefulWidget {
  const DocsPage({super.key});

  @override
  State<DocsPage> createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("documents".tr(), style: fonts.regularMain),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.builder(
              itemCount: _branchNames.length,
              itemBuilder: (context, index) {
                final branch = _branchNames[index];
                return FullPdfCard(branch: branch, colors: colors, fonts: fonts, icons: icons);
              },
            ),
          ),
        );
      },
    );
  }
}

class FullPdfCard extends StatelessWidget {
  const FullPdfCard({
    super.key,
    required this.branch,
    required this.colors,
    required this.fonts,
    required this.icons,
  });

  final BranchFullData branch;
  final CustomColorSet colors;
  final FontSet fonts;
  final IconSet icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Text(branch.title, style: fonts.regularMain),
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: branch.docs.length,
              separatorBuilder: (c, i) {
                return const Divider();
              },
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            Text(
                              "${List.generate(16, (count) => branch.docs[i]["title"]!)}",
                              style: fonts.xSmallMain,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            Text(
                              branch.docs[i]["size"]!,
                              style: fonts.xSmallMain,
                            ),
                          ],
                        ),
                      ),
                      WScaleAnimation(
                        onTap: () {
                          // if (branch.docs[i]["title"]!.length < 8) {
                          //   FileDownloadService().downloadPDFWithProgress(
                          //     context,
                          //     "url",
                          //     branch.docs[i]["title"]!,
                          //     colors.shade100,
                          //     colors.neutral600,
                          //   );
                          // } else {
                          //   FileDownloadService().downloadPDFWithProgress(
                          //     context,
                          //     "url",
                          //     branch.docs[i]["title"]!.substring(0, 8),
                          //     colors.shade100,
                          //     colors.neutral600,
                          //   );
                          // }
                        },
                        child: Container(
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: colors.neutral200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: icons.download.svg(),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const List<BranchFullData> _branchNames = [
  BranchFullData(
    title: 'Medion Clinic, Aesthetic & SPA - OOO "LABZAK PROMED"',
    docs: [
      {
        "title": "docs 1",
        "size": "pdf, 116.53 КБ",
      },
      {
        "title": "docs 2",
        "size": "pdf, 116.53 КБ",
      },
      {
        "title": "docs 3",
        "size": "pdf, 116.53 КБ",
      }
    ],
  ),
  BranchFullData(
    title: 'Medion Family Hospital - OOO "MEDION FAMILY HOSPITAL"',
    docs: [
      {
        "title": "documents 1",
        "size": "pdf, 116.53 КБ",
      },
      {
        "title": "documents 2",
        "size": "pdf, 116.53 КБ",
      },
      {
        "title": "documents 3",
        "size": "pdf, 116.53 КБ",
      },
    ],
  ),
  BranchFullData(
    title: 'Medion Clinic, Aesthetic & SPA - OOO "LABZAK PROMED"',
    docs: [
      {
        "title": "documents title 1",
        "size": "pdf, 116.53 КБ",
      },
      {
        "title": "documents title 2",
        "size": "pdf, 116.53 КБ",
      },
      {
        "title": "documents title 3",
        "size": "pdf, 116.53 КБ",
      },
    ],
  )
];

class BranchFullData {
  final String title;
  final List<Map<String, String>> docs;

  const BranchFullData({
    this.title = '',
    this.docs = const [],
  });
}
