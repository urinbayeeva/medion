// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
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

  Widget _buildShimmerAd() {
    return ShimmerView(
      child: Container(
        width: double.infinity,
        height: 160.h,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.ads.isEmpty) {
              return CarouselSlider(
                items: List.generate(1, (_) => _buildShimmerAd()),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.9,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 10),
                ),
              );
            }

            return CarouselSlider(
              items: state.ads
                  .skip(state.ads.length > 2 ? state.ads.length - 3 : 0)
                  .toList()
                  .asMap()
                  .entries
                  .map((entry) {
                final ad = entry.value;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: AnimationButtonEffect(
                            onTap: () => _launchUrl(ad.link.toString()),
                            child: CachedNetworkImage(
                              width: double.infinity,
                              imageUrl: ad.imageForMobileRu!,
                              fit: BoxFit.contain,
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
