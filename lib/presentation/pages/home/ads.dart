import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.fetchAds());
  }

  // Function to launch a URL safely
  void _launchUrl(String? url) async {
    if (url != null && url.isNotEmpty && await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      debugPrint("Invalid or unreachable URL: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.ads.isEmpty) {
              return Column(
                children: [
                  CarouselSlider(
                    items: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset("assets/images/ad_first.jpg"),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.5,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 10),
                    ),
                  ),
                ],
              );
            }

            return CarouselSlider(
              items: state.ads.map((ad) {
                // Splitting the info text into sentences
                List<String> sentences = ad.info?.split('. ') ?? [];
                List<String> topText = sentences.take(4).toList();
                List<String> bottomText = sentences.skip(4).toList();

                return AnimationButtonEffect(
                  onTap: () => _launchUrl(ad.link.toString()), // Launching specific ad URL
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        CachedImageComponent(
                          height: 250,
                          width: double.infinity,
                          imageUrl: ad.image!,
                        ),

                        // Top text (first 4 sentences)
                        Positioned(
                          child: IntrinsicWidth(
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: colors.shade0.withOpacity(0.7),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  20.h.verticalSpace,
                                  Text(ad.title ?? "",
                                      style: fonts.regularMain.copyWith(
                                          color: colors.primary900,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    topText.join('. ') + (topText.isNotEmpty ? '.' : ''),
                                    style: fonts.xSmallText.copyWith(
                                      color: colors.primary900,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Bottom text (remaining sentences)
                        if (bottomText.isNotEmpty)
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: IntrinsicWidth(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colors.shade0.withOpacity(0.7),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  bottomText.join('. ') + '.',
                                  style: fonts.xSmallText.copyWith(
                                    color: colors.primary900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 10),
              ),
            );
          },
        );
      },
    );
  }
}
