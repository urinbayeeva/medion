import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  const CommonImage({
    super.key,
    required this.imageUrl,
    this.errorImageAsset = "assets/images/medion_logo.png",
    this.imageBuilder,
    this.shimmer,
    this.errorWidget,
    this.width,
    this.height,
    this.color,
    this.colorBlendMode,
    this.radius = BorderRadius.zero,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeIn,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.useOldImageOnUrlChange = false,
    this.filterQuality = FilterQuality.low,
    this.placeholderFadeInDuration = const Duration(seconds: 3),
  });

  final String imageUrl;
  final String errorImageAsset;
  final BorderRadius radius;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? shimmer;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Duration fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;
  final bool useOldImageOnUrlChange;
  final Color? color;
  final FilterQuality filterQuality;
  final BlendMode? colorBlendMode;
  final Duration? placeholderFadeInDuration;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: imageBuilder,
        placeholder: shimmer ?? (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: errorWidget ??
            (context, url, error) => Center(
                  child: Image.asset(
                    errorImageAsset,
                    fit: fit,
                    height: height,
                    width: width,
                  ),
                ),
        fadeOutDuration: fadeOutDuration,
        fadeOutCurve: fadeOutCurve,
        fadeInDuration: fadeInDuration,
        fadeInCurve: fadeInCurve,
        width: width,
        height: height,
        fit: fit,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        color: color,
        filterQuality: filterQuality,
        colorBlendMode: colorBlendMode,
        placeholderFadeInDuration: placeholderFadeInDuration,
      ),
    );
  }
}
