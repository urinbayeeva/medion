import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:url_launcher/url_launcher.dart';

class WHtml extends StatefulWidget {
  const WHtml({
    super.key,
    required this.data,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.margin,
  });

  final String data;
  final Color textColor;
  final Color backgroundColor;
  final Margins? margin;

  @override
  State<WHtml> createState() => _WHtmlState();
}

class _WHtmlState extends State<WHtml> {
  bool isError = false;

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
        // ul tegi uchun (optimallashtirilgan)
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
                      final src = details.elementChildren[index].children.first.children.first.attributes['src'] ?? '';
                      return Container(
                        color: widget.backgroundColor,
                        child: CommonImage(
                          imageUrl: src,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      );
                    } catch (e) {
                      setState(() => isError = true);
                      return const SizedBox.shrink();
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
        // video tegi uchun
        TagExtension(
          tagsToExtend: {'video'},
          builder: (details) {
            try {
              final thumbnailSrc = details.attributes['poster'] ?? '';
              return GestureDetector(
                onTap: () {
                  final videoSrc = details.attributes['src'];
                  if (videoSrc != null) {
                    launchUrl(
                      Uri.parse(videoSrc),
                      mode: LaunchMode.externalApplication,
                    );
                  }
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
                        imageUrl: thumbnailSrc,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(6),
                          decoration: ShapeDecoration(
                            color: Colors.lightBlue.withValues(alpha: 0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } catch (e) {
              return const SizedBox.shrink();
            }
          },
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
      ],
    );
  }
}
