import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
import 'package:medion/presentation/pages/others/branches/widget/what_we_offer_card.dart';
import 'package:medion/presentation/pages/others/our_activity/component/license.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SingleBranchInfo extends StatefulWidget {
  final BranchModel branch;
  final VoidCallback? branchPhoneNumberButton;

  const SingleBranchInfo({
    super.key,
    required this.branch,
    this.branchPhoneNumberButton,
  });

  @override
  State<SingleBranchInfo> createState() => _SingleBranchInfoState();
}

class _SingleBranchInfoState extends State<SingleBranchInfo> {
  final Completer<YandexMapController> _controller = Completer<YandexMapController>();

  bool get _hasValidCoordinates =>
      widget.branch.latitude.toString().isNotEmpty && widget.branch.longitude.toString().isNotEmpty;

  bool get _hasValidImageUrl =>
      widget.branch.image != null &&
      widget.branch.image!.isNotEmpty &&
      Uri.tryParse(widget.branch.image!)?.isAbsolute == true;

  bool get _hasLicense =>
      widget.branch.licenses != null &&
      widget.branch.licenses!.isNotEmpty &&
      Uri.tryParse(widget.branch.licenses!.first)?.isAbsolute == true;

  @override
  void initState() {
    context.read<BranchBloc>().add(BranchEvent.getBranchDetail(id: widget.branch.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition? kYandexPlex = _hasValidCoordinates
        ? CameraPosition(target: Point(latitude: widget.branch.latitude, longitude: widget.branch.longitude), zoom: 14)
        : null;

    final List<MapObject> _mapObjects = _hasValidCoordinates
        ? [
            PlacemarkMapObject(
              mapId: const MapObjectId('branchLocation'),
              point: Point(latitude: widget.branch.latitude, longitude: widget.branch.longitude),
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(image: BitmapDescriptor.fromAssetImage('assets/branch_marker.png')),
              ),
              text: PlacemarkText(text: widget.branch.name ?? 'Branch', style: const PlacemarkTextStyle()),
            ),
          ]
        : [];

    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CAppBar(
                title: "branch".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace,
              ),
              BlocBuilder<BranchBloc, BranchState>(
                builder: (context, state) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                            child: Text(
                              widget.branch.name ?? 'branch_name_not_available'.tr(),
                              style: fonts.mediumMain.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          8.h.verticalSpace,
                          AnimationButtonEffect(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            onTap: () {},
                            child: CButtonIcon(
                              backgroundColor: colors.neutral200,
                              textColor: colors.primary900,
                              title: widget.branch.address ?? 'address_not_available'.tr(),
                              onTap: () {},
                              iconPath: icons.location,
                            ),
                          ),
                          8.h.verticalSpace,
                          IgnorePointer(
                            ignoring: true,
                            child: AnimationButtonEffect(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              onTap: () {},
                              child: CButtonIcon(
                                backgroundColor: colors.neutral200,
                                textColor: colors.primary900,
                                title: widget.branch.workTime.isNotEmpty
                                    ? widget.branch.workTime
                                    : state.branchDetail?.workTime ?? '',
                                onTap: () {},
                                iconPath: icons.clock,
                              ),
                            ),
                          ),
                          12.h.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              widget.branch.description?.isEmpty ?? true
                                  ? "about_medion".tr()
                                  : widget.branch.description!,
                              style: fonts.smallLink.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
                            ),
                          ),
                          8.h.verticalSpace,
                          if (state.branchDetail?.images?.length != null && state.branchDetail!.images!.isNotEmpty) ...[
                            CarouselSlider(
                              items: List.generate(
                                state.branchDetail!.images!.length,
                                (i) {
                                  final image = state.branchDetail!.images![i];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: colors.neutral400),
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(7.8.r),
                                        child: CachedNetworkImage(
                                          imageUrl: image,
                                          fit: BoxFit.cover,
                                          height: 200.h,
                                          width: double.infinity,
                                          errorWidget: (context, url, error) => _buildImagePlaceholder(colors),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 1.9,
                                viewportFraction: 0.9,
                                autoPlayInterval: const Duration(seconds: 10),
                              ),
                            ),
                          ],
                          if (widget.branch.ourOffer?.isNotEmpty ?? false) ...[
                            12.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text("what_we_offer".tr(), style: fonts.regularMain),
                            ),
                            12.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text("what_we_offer".tr(), style: fonts.regularMain),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    widget.branch.ourOffer!.length,
                                    (i) {
                                      OfferModel model = widget.branch.ourOffer![i];
                                      return Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(model.name ?? ''),
                                            Text(model.description ?? ''),
                                            Text(model.icon ?? ''),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                          Licenses(
                            available: state.branchDetail?.licenses != null && state.branchDetail!.licenses!.isNotEmpty,
                            fonts: fonts,
                            state: state,
                            colors: colors,
                          ),
                          24.h.verticalSpace,
                          Text(
                            "address_branch".tr(),
                            style: fonts.regularMain.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          16.h.verticalSpace,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 200.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: kYandexPlex != null
                                  ? YandexMap(
                                      mapObjects: _mapObjects,
                                      onMapCreated: (YandexMapController controller) async {
                                        _controller.complete(controller);
                                        await controller.moveCamera(
                                          CameraUpdate.newCameraPosition(kYandexPlex),
                                        );
                                      },
                                      onCameraPositionChanged: (position, reason, finished) {},
                                    )
                                  : _buildMapPlaceholder(colors),
                            ),
                          ),
                          16.h.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              widget.branch.address ?? 'address_not_available'.tr(),
                              style: fonts.smallLink.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          16.h.verticalSpace,
                          CButtonIcon(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            title: "call".tr(),
                            onTap: widget.branchPhoneNumberButton ?? () {},
                            iconPath: icons.phone,
                            textColor: colors.shade0,
                            iconColor: colors.shade0,
                          ),
                          40.h.verticalSpace,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagePlaceholder(colors) {
    return Container(
      height: 200.h,
      color: colors.neutral200,
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          color: colors.neutral500,
          size: 40.w,
        ),
      ),
    );
  }

  Widget _buildMapPlaceholder(colors) {
    return Container(
      color: colors.neutral200,
      child: Center(
        child: Icon(
          Icons.map_outlined,
          color: colors.neutral500,
          size: 40.w,
        ),
      ),
    );
  }
}

class Licenses extends StatelessWidget {
  const Licenses({
    super.key,
    required this.available,
    required this.fonts,
    required this.state,
    required this.colors,
  });

  final bool available;
  final FontSet fonts;
  final BranchState state;
  final CustomColorSet colors;

  @override
  Widget build(BuildContext context) {
    if (!available) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        12.h.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "license".tr(),
              style: fonts.regularMain.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        8.h.verticalSpace,
        Row(
          children: state.branchDetail!.licenses!.map((licenseUrl) {
            final length = state.branchDetail!.licenses!.length;
            return Padding(
              padding: EdgeInsets.only(right: 8.w, left: length == 1 ? 16 : 0),
              child: DecoratedBox(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0)),
                child: CachedNetworkImage(
                  imageUrl: licenseUrl,
                  width: 150.w,
                  errorWidget: (context, url, error) => _buildLicensePlaceholder(colors, fonts),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildLicensePlaceholder(colors, fonts) {
    return Container(
      width: 150.w,
      height: 100.h,
      color: colors.neutral200,
      child: Center(
        child: Text(
          "no_result_found".tr(),
          style: fonts.smallLink,
        ),
      ),
    );
  }
}
