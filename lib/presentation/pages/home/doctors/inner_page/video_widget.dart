import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final String image;
  final List<String> videos;

  const VideoWidget({
    super.key,
    required this.videoUrl,
    required this.image,
    required this.videos,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  final ValueNotifier<bool> _isInitialized = ValueNotifier(false);
  final ValueNotifier<bool> _play = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );

    _controller.initialize().then((_) {
      _isInitialized.value = true;
      _controller.setLooping(true);
      if (_play.value) {
        _controller.play();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    chewieController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ValueListenableBuilder(
        valueListenable: _isInitialized,
        builder: (context, val, child) {
          if (_isInitialized.value) {
            return GestureDetector(
              onLongPress: () {},
              onTap: () async {
                if (_play.value == true) {
                  _controller.pause();
                  _play.value = false;
                } else {
                  _controller.play();
                  _play.value = true;
                }
              },
              child: ValueListenableBuilder(
                valueListenable: _play,
                builder: (con, val, child) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: DecoratedBox(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                          child: SizedBox(
                            width: 0.75.sw,
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              // child: VideoPlayer(_controller),
                              child: Chewie(controller: chewieController),
                            ),
                          ),
                        ),
                      ),
                      if (_play.value == false) ...{
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Center(
                            child: icons.playButton.svg(),
                          ),
                        ),
                      }
                    ],
                  );
                },
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                width: 0.75.sw,
                child: Column(
                  children: [
                    CommonImage(
                      imageUrl: widget.image,
                      width: double.infinity,
                      height: 140.h,
                    ),
                    VideoProgressIndicator(_controller, allowScrubbing: false),
                  ],
                ),
              ),
            );
          }
        },
      );
    });
  }
}
