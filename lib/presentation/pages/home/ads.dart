import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

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

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.ads.isEmpty) {
          return Column(
            children: [
              CarouselSlider(
                items: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset("assets/images/ad_first.jpg"))
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 10),
                ),
              )

              // Text(state.ads.first.title ?? "", style: fonts.regularMain),
              // Text(state.ads.first.info ?? "", style: fonts.regularMain),
            ],
          );
        }

        return Column(
          children: [
            CarouselSlider(
              items: state.ads.map((ad) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedImageComponent(
                    height: 250,
                    width: double.infinity,
                    imageUrl: ad.image!,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 10),
              ),
            )

            // Text(state.ads.first.title ?? "", style: fonts.regularMain),
            // Text(state.ads.first.info ?? "", style: fonts.regularMain),
          ],
        );
      });
    });
  }
}
