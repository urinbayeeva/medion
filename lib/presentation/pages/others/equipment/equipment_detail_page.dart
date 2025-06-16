import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/w_html/w_html_has_ellipsis.dart';

import 'package:medion/presentation/pages/others/equipment/equipment_slider_card.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class EquipmentDetailPage extends StatefulWidget {
  const EquipmentDetailPage({super.key, required this.content});

  final ContentModel content;

  @override
  State<EquipmentDetailPage> createState() => _EquipmentDetailPageState();
}

class _EquipmentDetailPageState extends State<EquipmentDetailPage> {
  late ScrollController scrollController;
  ValueNotifier<bool> showTitle = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        showTitle.value = scrollController.position.pixels > kToolbarHeight ? true : false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.neutral200,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CAppBar(
                  title: "equipment".tr(),
                  isBack: true,
                  centerTitle: true,
                  bordered: true,
                  trailing: 24.w.horizontalSpace,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: colors.shade0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.content.title,
                            style: fonts.mediumMain,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                    WHtmlFull(
                      data: widget.content.description,
                      hasEllipsis: false,
                    ),
                  ],
                ),
                if (widget.content.children.length == 1) ...[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: EquipmentCarouselCard(
                        child: widget.content.children.first,
                        fonts: fonts,
                        length: widget.content.children.length,
                      ),
                    ),
                  )
                ] else ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          widget.content.children.length,
                          (i) {
                            final child = widget.content.children[i];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0, bottom: 10),
                              child: EquipmentCarouselCard(
                                child: child,
                                fonts: fonts,
                                length: widget.content.children.length + 5,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
