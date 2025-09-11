import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class ServiceBottomSheet extends StatelessWidget {
  const ServiceBottomSheet({
    super.key,
    required this.order,
    required this.services,
  });

  final PatientOrder order;
  final List<SaleOrderLine> services;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, ctrl) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                12.h.verticalSpace,

                /// Drag indicator
                Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SizedBox(width: 40.w, height: 4.h),
                  ),
                ),
                12.h.verticalSpace,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  itemCount: services.length,
                  separatorBuilder: (_, __) => Divider(color: colors.neutral200),
                  itemBuilder: (context, i) {
                    final sale = services[i];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (i != 0) 10.h.verticalSpace,
                          Text(
                            sale.serviceType ?? "—",
                            style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            List.generate(120, (i) => "- ").join(""),
                            maxLines: 1,
                            style: fonts.xSmallMain.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffbdbbbb),
                            ),
                          ),
                          8.h.verticalSpace,

                          /// Service ID
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Service ID:", style: fonts.xSmallMain),
                              Text(
                                "${sale.serviceId ?? "—"}",
                                style: fonts.xSmallMain.copyWith(),
                              ),
                            ],
                          ),
                          8.h.verticalSpace,

                          /// Doctor
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Доктор:", style: fonts.xSmallMain),
                              Row(
                                children: [
                                  CommonImage(
                                    imageUrl: "imageUrl",
                                    height: 32.h,
                                    width: 32.w,
                                  ),
                                  8.w.horizontalSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sale.doctor ?? "—",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        sale.doctorJob ?? "—",
                                        overflow: TextOverflow.ellipsis,
                                        style: fonts.xSmallMain,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          8.h.verticalSpace,

                          /// Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Время обслуживания:", style: fonts.xSmallMain),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: colors.neutral200,
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    child: Text(
                                      "${sale.date ?? ''} - ${sale.date ?? ''}",
                                      style: fonts.xSmallMain.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  4.h.verticalSpace,
                                  Text(sale.date ?? "", style: fonts.xSmallMain),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                40.h.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
