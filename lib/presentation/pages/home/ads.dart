// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
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
                        child: Image.asset(
                          "assets/images/ad_first.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.9,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 10),
                    ),
                  ),
                ],
              );
            }

            return CarouselSlider(
              items: state.ads.asMap().entries.map((entry) {
                final index = entry.key;
                final ad = entry.value;
                List<String> sentences = ad.info?.split('. ') ?? [];
                List<String> bottomText = sentences.skip(4).toList();

                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: CachedImageComponent(
                            width: double.infinity,
                            height: 250,
                            imageUrl: ad.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.7,
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
