import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class WHtmlReadLessMore extends StatefulWidget {
  const WHtmlReadLessMore({super.key, required this.data, this.isReadMore = false});

  final String data;
  final bool isReadMore;

  @override
  State<WHtmlReadLessMore> createState() => _WHtmlReadLessMoreState();
}

class _WHtmlReadLessMoreState extends State<WHtmlReadLessMore> {
  bool isError = false;
  late bool _isReadMore;

  @override
  void initState() {
    super.initState();
    _isReadMore = widget.isReadMore;
  }

  String _filterHtmlContent(String html) {
    if (_isReadMore) return html;
    RegExp pTagRegex = RegExp(r'<p[^>]*>.*?</p>', multiLine: true);
    var match = pTagRegex.firstMatch(html);
    if (match != null) {
      return match.group(0)!;
    }
    return html;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              onLinkTap: (url, attributes, element) {
                launchUrl(
                  Uri.parse(url!),
                  mode: LaunchMode.externalApplication,
                );
              },
              shrinkWrap: false,
              data: _filterHtmlContent(widget.data),
              // Filter HTML based on isReadMore
              extensions: [
                TagExtension(
                  tagsToExtend: {'h3'},
                  builder: (p0) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(),
                  ),
                ),
                TagExtension(
                  tagsToExtend: {'ul'},
                  builder: (details) {
                    try {
                      return SizedBox(
                        height: isError ? 0 : 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            try {
                              return Image.network(
                                details.elementChildren[index].children.first.children.first.attributes['src'] ?? '',
                              );
                            } catch (e) {
                              isError = true;
                              return const SizedBox();
                            }
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: 16),
                          itemCount: details.elementChildren.length,
                        ),
                      );
                    } catch (e) {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                TagExtension(
                  tagsToExtend: {'video'},
                  builder: (details) {
                    try {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          // Add video src navigation logic here
                        },
                        child: SizedBox(
                          height: 210,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              CommonImage(
                                radius: const BorderRadius.vertical(top: Radius.circular(12)),
                                height: 210,
                                width: MediaQuery.of(context).size.width,
                                imageUrl: '',
                              ),
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  padding: const EdgeInsets.all(6),
                                  decoration: ShapeDecoration(
                                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  // child: SvgPicture.asset(AppIcons.playReels),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } catch (e) {
                      return const SizedBox();
                    }
                  },
                ),
                TagExtension(
                  tagsToExtend: {'ol'},
                  builder: (details) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "${details.attributes["start"] ?? "1"}. ",
                              style: TextStyle(
                                color: fonts.displayFirst.color,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                details.element?.text ?? "",
                                style: TextStyle(
                                  color: fonts.displayFirst.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                TagExtension(
                  tagsToExtend: {'blockquote'},
                  builder: (details) {
                    try {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          margin: const EdgeInsets.only(),
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            right: 16,
                            left: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            border: const Border(
                              left: BorderSide(
                                color: Color(0xff1689FF),
                                width: 5,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Builder(
                                builder: (context) {
                                  String words = "";
                                  for (int i = 0; i < details.element!.children.length; i++) {
                                    final node = details.element!.children[i];
                                    for (int j = 0; j < node.children.length; j++) {
                                      final child = node.children[j];
                                      if (child.attributes.containsKey('src')) {
                                        words = child.attributes['src']!;
                                      }
                                    }
                                  }
                                  return Builder(
                                    builder: (context) {
                                      final element = details.element;
                                      String description = "";
                                      String author = "";
                                      for (var item in (element?.children ?? [])) {
                                        if (item.text.isNotEmpty) {
                                          if (description.isEmpty) {
                                            description = item.text;
                                          } else {
                                            author = item.text;
                                          }
                                        }
                                      }
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            description,
                                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (words.isNotEmpty)
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 12.0),
                                                  child: CommonImage(
                                                    imageUrl: words.trim(),
                                                    height: 52,
                                                    width: 52,
                                                    fit: BoxFit.cover,
                                                    radius: BorderRadius.circular(26),
                                                  ),
                                                )
                                              else
                                                const SizedBox.shrink(),
                                              Expanded(
                                                child: Text(
                                                  author,
                                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    } catch (e) {
                      return const SizedBox();
                    }
                  },
                ),
                TagExtension(
                  tagsToExtend: {"img"},
                  builder: (detail) {
                    final attributes = detail.attributes;
                    final widthString = attributes['width'];
                    double? width = widthString != null ? double.tryParse(widthString.replaceAll("px", "")) : null;
                    final styleString = attributes["style"];
                    if (width == null && styleString != null) {
                      final styleWidth = RegExp(r'width:\s*(\d+)px').firstMatch(styleString)?.group(1);
                      width = styleWidth != null ? double.tryParse(styleWidth) : null;
                    }
                    final src = attributes['src'];
                    if (src != null) {
                      final isBase64 = src.startsWith("data:image/");
                      if (isBase64) {
                        final base64Str = src.split(',').last;
                        final imageBytes = base64Decode(base64Str);
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.memory(
                            imageBytes,
                            width: width ?? MediaQuery.of(context).size.width,
                            height: width ?? 211,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: width ?? MediaQuery.of(context).size.width,
                          child: CommonImage(
                            height: width ?? 211,
                            width: width ?? MediaQuery.of(context).size.width,
                            imageUrl: src,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
              style: {
                "p": Style(
                  color: fonts.displayFirst.color,
                  fontSize: FontSize(14),
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.justify,
                  maxLines: _isReadMore ? null : 3,
                  // Limit lines when read less
                  textOverflow: _isReadMore ? null : TextOverflow.ellipsis, // Ellipsis when read less
                ),
                "strong br": Style(
                  color: fonts.displayFirst.color,
                  fontSize: FontSize(20),
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.justify,
                ),
                "br": Style(
                  fontSize: FontSize(20),
                  color: fonts.displayFirst.color,
                  fontWeight: FontWeight.w900,
                  textAlign: TextAlign.justify,
                ),
                "ol": Style(
                  color: fonts.displayFirst.color,
                  textAlign: TextAlign.justify,
                  fontSize: FontSize(20),
                  fontWeight: FontWeight.w700,
                ),
              },
            ),
            // Add Read More/Read Less button
            if (RegExp(r'<p[^>]*>.*?</p>').hasMatch(widget.data) && widget.data.length > 100)
              WScaleAnimation(
                onTap: () {
                  setState(() {
                    _isReadMore = !_isReadMore;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 2,
                  children: [
                    Text(
                      _isReadMore ? 'Read Less' : 'Read More',
                      style: const TextStyle(color: Color(0xffD90506), fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Icon(_isReadMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.red)
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
