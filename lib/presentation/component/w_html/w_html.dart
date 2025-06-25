import 'dart:convert';
import 'dart:developer';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hive/hive.dart';
import 'package:html/dom.dart' as dom;
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:url_launcher/url_launcher.dart';

class WHtml extends StatefulWidget {
  const WHtml({
    super.key,
    required this.data,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.margin,
    this.videoMargin = EdgeInsets.zero,
  });

  final String data;
  final Color textColor;
  final Color backgroundColor;
  final Margins? margin;
  final EdgeInsetsGeometry videoMargin;

  @override
  State<WHtml> createState() => _WHtmlState();
}

class _WHtmlState extends State<WHtml> {
  ValueNotifier<bool> isError = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: widget.data,
      shrinkWrap: true,
      onLinkTap: (url, attributes, element) {
        if (url != null) {
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
        }
      },
      style: {
        '*': Style(
          backgroundColor: widget.backgroundColor,
          margin: widget.margin ?? Margins.zero,
        ),
        'p': Style(
          color: widget.textColor,
          fontSize: FontSize(14),
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.justify,
          backgroundColor: widget.backgroundColor,
        ),
        'br': Style(
          color: widget.textColor,
          fontSize: FontSize(20),
          fontWeight: FontWeight.w900,
          backgroundColor: widget.backgroundColor,
        ),
        'ol': Style(
          color: widget.textColor,
          fontSize: FontSize(20),
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.justify,
          backgroundColor: widget.backgroundColor,
        ),
        'ul': Style(
          backgroundColor: widget.backgroundColor,
        ),
        'blockquote': Style(
          backgroundColor: widget.backgroundColor,
        ),
      },
      extensions: [
        // h3 tegi uchun
        TagExtension(
          tagsToExtend: {'h3'},
          builder: (context) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(),
          ),
        ),
        TagExtension(
          tagsToExtend: {'ol'},
          builder: (details) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: widget.backgroundColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${details.attributes['start'] ?? '1'}. ',
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          backgroundColor: widget.backgroundColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        details.element?.text ?? '',
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          backgroundColor: widget.backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        TagExtension(
          tagsToExtend: {'blockquote'},
          builder: (details) {
            try {
              String imageSrc = '';
              String description = '';
              String author = '';

              // Parse blockquote content
              for (var child in details.element?.children ?? []) {
                if (child.text.isNotEmpty) {
                  if (description.isEmpty) {
                    description = child.text;
                  } else {
                    author = child.text;
                  }
                }
                for (var subChild in child.children) {
                  if (subChild.attributes.containsKey('src')) {
                    imageSrc = subChild.attributes['src']!;
                  }
                }
              }

              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: const Border(
                      left: BorderSide(
                        color: Color(0xFF1689FF),
                        width: 5,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: widget.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      if (author.isNotEmpty || imageSrc.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (imageSrc.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: CommonImage(
                                  imageUrl: imageSrc,
                                  height: 52,
                                  width: 52,
                                  fit: BoxFit.cover,
                                  radius: BorderRadius.circular(26),
                                ),
                              ),
                            if (author.isNotEmpty)
                              Expanded(
                                child: Text(
                                  author,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: widget.textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              );
            } catch (e) {
              return const SizedBox.shrink();
            }
          },
        ),
        // img tegi uchun
        TagExtension(
          tagsToExtend: {'img'},
          builder: (details) {
            final attributes = details.attributes;
            final src = attributes['src'];
            if (src == null) return const SizedBox.shrink();

            double? width;
            final widthString = attributes['width'];
            if (widthString != null) {
              width = double.tryParse(widthString.replaceAll('px', ''));
            } else {
              final styleString = attributes['style'];
              if (styleString != null) {
                final styleWidth = RegExp(r'width:\s*(\d+)px').firstMatch(styleString)?.group(1);
                width = styleWidth != null ? double.tryParse(styleWidth) : null;
              }
            }

            if (src.startsWith('data:image/')) {
              final base64Str = src.split(',').last;
              final imageBytes = base64Decode(base64Str);
              return Container(
                width: width ?? MediaQuery.of(context).size.width,
                color: widget.backgroundColor,
                child: Image.memory(
                  imageBytes,
                  width: width ?? MediaQuery.of(context).size.width,
                  height: width ?? 211,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              );
            } else {
              return Container(
                width: width ?? MediaQuery.of(context).size.width,
                color: widget.backgroundColor,
                child: CommonImage(
                  imageUrl: src,
                  width: width ?? MediaQuery.of(context).size.width,
                  height: width ?? 211,
                  fit: BoxFit.cover,
                ),
              );
            }
          },
        ),
        // video tegi uchun
        TagExtension(
          tagsToExtend: {'video'},
          builder: (details) {
            if (details.elementChildren.isNotEmpty) {
              try {
                final sourceTag = details.elementChildren
                    .firstWhere((el) => el.localName == 'source' && el.attributes.containsKey('src'));

                final videoSrc = sourceTag.attributes['src'];
                if (videoSrc == null || videoSrc.isEmpty || !Uri.parse(videoSrc).isAbsolute) {
                  return const SizedBox.shrink();
                }

                return ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: VideoPlay(url: videoSrc, margin: widget.videoMargin),
                );
              } catch (e) {
                debugPrint('Error rendering video tag: $e');
                return const SizedBox.shrink();
              }
            }
            return const SizedBox.shrink();
          },
        ),
        // ul tegi uchun (optimallashtirilgan)
        TagExtension(
          tagsToExtend: {'ul'},
          builder: (ExtensionContext details) {
            final children = details.elementChildren;

            String determineContentType(List<dom.Element> children) {
              if (children.isEmpty) return 'empty';
              bool hasOnlyVideos = true;
              bool hasOnlyImages = true;
              bool hasOnlyText = true;

              for (var li in children) {
                if (li.localName != 'li') continue;
                final liChildren = li.children;

                if (liChildren.isEmpty) {
                  if (li.text.trim().isNotEmpty) {
                    hasOnlyVideos = false;
                    hasOnlyImages = false;
                  } else {
                    hasOnlyText = false;
                  }
                } else {
                  final hasVideo = liChildren.any((el) => el.localName == 'video');
                  final hasImage = liChildren.any((el) => el.localName == 'img');
                  final hasOther = liChildren.any((el) => el.localName != 'video' && el.localName != 'img');

                  if (hasVideo) {
                    hasOnlyImages = false;
                    hasOnlyText = false;
                  }
                  if (hasImage) {
                    hasOnlyVideos = false;
                    hasOnlyText = false;
                  }
                  if (hasOther || li.text.trim().isNotEmpty) {
                    hasOnlyVideos = false;
                    hasOnlyImages = false;
                  }
                }
              }

              if (hasOnlyVideos) return 'videos';
              if (hasOnlyImages) return 'images';
              if (hasOnlyText) return 'text';
              return 'mixed';
            }

            final contentType = determineContentType(children);

            log("Content type: $contentType");

            if (contentType == 'empty') {
              return const SizedBox.shrink();
            } else if (contentType == 'videos') {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: children.length,
                itemBuilder: (context, index) {
                  final li = children[index];
                  final video = li.children.firstWhere(
                    (el) => el.localName == 'video',
                  );
                  if (video.className.isEmpty) return const Text("Empty");

                  final sourceTag = video.children.firstWhere(
                    (el) => el.localName == 'source' && el.attributes.containsKey('src'),
                  );
                  final videoSrc = sourceTag.attributes['src'];
                  if (videoSrc == null || videoSrc.isEmpty || !Uri.parse(videoSrc).isAbsolute) {
                    return const Text("data");
                  }

                  return ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Container(
                      margin: EdgeInsets.zero,
                      child: VideoPlay(url: videoSrc),
                    ),
                  );
                },
              );
            } else if (contentType == 'images') {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: children.length,
                itemBuilder: (context, index) {
                  final li = children[index];
                  final img = li.children.firstWhere(
                    (el) => el.localName == 'img',
                  );
                  final imgSrc = img.attributes['src'];
                  if (imgSrc == null || imgSrc.isEmpty) return const SizedBox.shrink();

                  return Container(
                    margin: EdgeInsets.zero,
                    child: Image.network(
                      imgSrc,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                    ),
                  );
                },
              );
            } else if (contentType == 'text') {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: children.length,
                itemBuilder: (context, index) {
                  final li = children[index];
                  final text = li.text.trim();
                  if (text.isEmpty) return const SizedBox.shrink();

                  return Container(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              );
            } else {
              return const Text("Mixed");
            }
          },
        ),
      ],
    );
  }
}

class VideoPlay extends StatefulWidget {
  const VideoPlay({
    super.key,
    required this.url,
    this.margin = EdgeInsets.zero,
  });

  final String url;
  final EdgeInsetsGeometry margin;

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late CachedVideoPlayerPlusController controller;
  static const List<String> imageExtensions = ['png', 'jpg', 'jpeg', 'webp'];
  late final bool isImage;
  ValueNotifier<bool> isInitialized = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    log("Video");
    isImage = imageExtensions.any(
      (ext) => widget.url.toLowerCase().endsWith(ext),
    );

    if (!isImage) {
      controller = CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.url))
        ..addListener(() async {
          final position = await controller.position;
          if ((position?.inMilliseconds ?? 0) >= controller.value.duration.inMilliseconds) {
            // Video tugadi
            debugPrint("Video completed: ${widget.url}");
          }
        })
        ..initialize().then((_) {
          controller.setLooping(true);
          controller.play(); // Auto-play
          debugPrint("Video started: ${widget.url}");
          if (mounted) {
            isInitialized.value = true;
          }
        });
    }
  }

  @override
  void dispose() {
    if (!isImage) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isInitialized,
      builder: (c, val, chi) {
        if (isImage) {
          return Image.network(
            widget.url,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image)),
          );
        } else {
          if (!isInitialized.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: widget.margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CachedVideoPlayerPlus(controller),
              ),
            ),
          );
        }
      },
    );
  }
}
