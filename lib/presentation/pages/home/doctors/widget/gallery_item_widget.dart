import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/branches/widget/image_dialog.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class GalleryItemWidget extends StatefulWidget {
  const GalleryItemWidget({
    super.key,
    required this.gallery,
  });

  final List<GalleryItems> gallery;

  @override
  State<GalleryItemWidget> createState() => _GalleryItemWidgetState();
}

class _GalleryItemWidgetState extends State<GalleryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        if (widget.gallery.isEmpty) {
          return _empty(colors, fonts);
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors.shade0,
          ),
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          height: 160.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: [
                ...List.generate(
                  widget.gallery.length,
                  (i) {
                    final item = widget.gallery.reversed.toList()[i];
                    bool hasVideo = item.type == "video";

                    return WScaleAnimation(
                      onTap: () {
                        final List<ContentBase> contentBaseList = [
                          ...widget.gallery.where((item) => item.fileUrl.isNotEmpty).map((item) => ContentBase(
                                isVideo: item.type.toLowerCase() == 'video',
                                fileLink: item.type.toLowerCase() == 'video'
                                    ? "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4"
                                    : item.fileUrl,
                                coverImage: item.videoImage,
                              ))
                        ];

                        final List<ContentBase> images = [...contentBaseList];
                        MyFunctions.showImages(
                          isVideo: hasVideo,
                          context: context,
                          mainImage: item.fileUrl,
                          images: [...images],
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              width: 0.75.sw,
                              height: double.infinity,
                              margin: EdgeInsets.fromLTRB(
                                i == 0 ? 10 : 0,
                                8.h,
                                i == widget.gallery.length - 1 ? 10 : 0,
                                8.h,
                              ),
                              decoration: BoxDecoration(
                                color: colors.neutral200,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.4),
                              child: CommonImage(
                                radius: BorderRadius.circular(6.r),
                                imageUrl: hasVideo ? item.videoImage : item.fileUrl,
                              ),
                            ),
                          ),
                          if (hasVideo) ...{
                            Center(
                              child: SizedBox(
                                height: 36.h,
                                width: 36.w,
                                child: icons.playButton.svg(),
                              ),
                            ),
                          }
                        ],
                      ),
                    );

                    // if (hasVideo) {
                    //   return VideoWidget(
                    //     videos: [...videos],
                    //     image: item.videoImage,
                    //     videoUrl: item.fileUrl,
                    //     // videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                    //   );
                    // } else {
                    //
                    // }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _empty(CustomColorSet colors, FontSet fonts) {
    return Container(
      height: 118,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: colors.shade0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text("no_result_found".tr(), style: fonts.regularMain)),
    );
  }
}
