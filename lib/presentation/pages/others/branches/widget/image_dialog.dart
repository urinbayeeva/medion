import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class ContentBase {
  final bool isVideo;
  final String fileLink;
  final String coverImage;

  const ContentBase({
    required this.isVideo,
    required this.fileLink,
    required this.coverImage,
  });
}

class ImageDialog extends StatefulWidget {
  final List<ContentBase> images;
  final double height;
  final double width;
  final String mainImage;
  final bool isVideo;
  final bool isLicence;

  const ImageDialog({
    super.key,
    this.height = 218,
    this.width = 343,
    required this.images,
    required this.mainImage,
    required this.isVideo,
    required this.isLicence,
  });

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  late ValueNotifier<ContentBase> _selectedImage;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _selectedImage = ValueNotifier<ContentBase>(
      ContentBase(
        isVideo: widget.isVideo,
        fileLink: widget.mainImage,
        coverImage: widget.mainImage,
      ),
    );
  }

  Future<void> _initializeVideo(File file) async {
    _videoController?.dispose();
    // _videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    _videoController = VideoPlayerController.file(file);
    await _videoController!.initialize();
    _videoController!.pause();
    setState(() {});
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _selectedImage.dispose();
    super.dispose();
  }

  void _onItemSelected(ContentBase content) async {
    _selectedImage.value = content;

    if (content.isVideo) {
      // MyFunctions.videoContentType(content.fileLink);
      final file = await MyFunctions.downloadVideo(url: content.fileLink);

      log("File info--- ${file?.path ?? ''}");
      if (file != null) {
        await _initializeVideo(file);
      }
    } else {
      _videoController?.dispose();
      _videoController = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ContentBase>(
      valueListenable: _selectedImage,
      builder: (context, selected, _) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: widget.isLicence ? 500.h : 200.h),
                child: PageView(
                  onPageChanged: (index) {
                    final img = widget.images[index];
                    _onItemSelected(img);
                  },
                  children: [
                    ...List.generate(
                      widget.images.length,
                      (i) => Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: selected.isVideo
                                ? _videoController != null && _videoController!.value.isInitialized
                                    ? SizedBox(
                                        width: widget.width.w,
                                        height: widget.height.h,
                                        child: AspectRatio(
                                          aspectRatio: _videoController!.value.aspectRatio,
                                          child: VideoPlayer(_videoController!),
                                        ),
                                      )
                                    : Container(
                                        width: widget.width.w,
                                        height: widget.height.h,
                                        color: Colors.black12,
                                        alignment: Alignment.center,
                                        child: const CircularProgressIndicator(),
                                      )
                                : Image.network(
                                    selected.fileLink,
                                    width: widget.width.w,
                                    height: widget.height.h,
                                    fit: BoxFit.cover,
                                  ),
                          ),

                          // Play/Pause button for video
                          if (selected.isVideo && _videoController != null && _videoController!.value.isInitialized)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _videoController!.value.isPlaying
                                      ? _videoController!.pause()
                                      : _videoController!.play();
                                });
                              },
                              child: CircleAvatar(
                                radius: 24.r,
                                backgroundColor: Colors.black54,
                                child: Icon(
                                  _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 28.r,
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Bottom thumbnails
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.images.map((img) {
                    final isSelected = selected.fileLink == img.fileLink;
                    return GestureDetector(
                      onTap: () => _onItemSelected(img),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        // padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CommonImage(
                            imageUrl: img.isVideo ? img.coverImage : img.fileLink,
                            width: 80.w,
                            height: 58.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
