import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/w_html/w_html_has_readmore.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';

class EquipmentCarouselCard extends StatefulWidget {
  const EquipmentCarouselCard({super.key, required this.child, required this.fonts, required this.length});

  final ChildContentModel child;
  final FontSet fonts;
  final int length;

  @override
  State<EquipmentCarouselCard> createState() => _EquipmentCarouselCardState();
}

class _EquipmentCarouselCardState extends State<EquipmentCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.length > 2 ? 296.w : MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonImage(
              height: 142.h,
              imageUrl: widget.child.primaryImage,
              radius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Column(
                spacing: 0,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.child.title,
                    style: widget.fonts.regularMain,
                  ),
                  WHtmlReadLessMore(
                    data: "${widget.child.description} ",
                    isReadMore: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
