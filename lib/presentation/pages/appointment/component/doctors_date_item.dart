import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DoctorsDateItem extends StatefulWidget {
  final String? name;
  final String? profession;
  final String? image;
  final List<dynamic>? dates;

  const DoctorsDateItem({
    super.key,
    this.name,
    this.profession,
    this.image,
    this.dates,
  });

  @override
  State<DoctorsDateItem> createState() => _DoctorsDateItemState();
}

class _DoctorsDateItemState extends State<DoctorsDateItem> {
  int _selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Information
            ListTile(
              isThreeLine: true,
              leading: Container(
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: colors.neutral200,
                ),
                child: widget.image != null && widget.image!.isNotEmpty
                    ? CachedNetworkImage(imageUrl: widget.image!)
                    : icons.nonUser.svg(),
              ),
              title: Text(
                widget.name ?? "",
                style: fonts.smallMain.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                widget.profession ?? "",
                style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: colors.primary900,
                ),
              ),
            ),
            12.h.verticalSpace,
            Text("select_date".tr(),
                style: fonts.xSmallMain.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                )),
            6.h.verticalSpace,

            if (widget.dates != null && widget.dates!.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.dates!.length,
                  itemBuilder: (context, index) {
                    String date =
                        widget.dates![index].keys.first; // Date as string
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDateIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        width: 140.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          border: _selectedDateIndex == index
                              ? null
                              : Border.all(width: 1, color: colors.neutral400),
                          color: _selectedDateIndex == index
                              ? colors.error500
                              : colors.shade0,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            date,
                            style: TextStyle(
                              color: _selectedDateIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      );
    });
  }
}
