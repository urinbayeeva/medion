import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_bottom_icon.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/map/map_with_polylines.dart';
import 'package:medion/presentation/pages/others/branches/component/license.dart';
import 'package:medion/presentation/pages/others/branches/widget/image_dialog.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  late final RefreshController _refreshController;

  bool get _hasValidCoordinates =>
      widget.branch.latitude.toString().isNotEmpty && widget.branch.longitude.toString().isNotEmpty;

  @override
  void initState() {
    _refreshController = RefreshController();
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
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("branch".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<BranchBloc, BranchState>(
            buildWhen: (o, n) {
              final branch = o.branchDetail != n.branchDetail;
              final status = o.branchDetailStatus != n.branchDetailStatus;
              return branch || status;
            },
            builder: (context, state) {
              if (state.branchDetailStatus.isInProgress || state.branchDetailStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (state.branchDetailStatus.isFailure) {
                return Center(child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink));
              }

              return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                header: const WaterDropMaterialHeader(color: Style.shade0, backgroundColor: Style.error500),
                onRefresh: () {
                  context.read<BranchBloc>().add(BranchEvent.getBranchDetail(id: widget.branch.id));
                  _refreshController.refreshCompleted();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      16.h.verticalSpace,
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
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(
                                MaterialPageRoute(
                                  builder: (ctx) => MapWithPolylines(
                                    destination: Point(
                                      latitude: state.branchDetail!.latitude,
                                      longitude: state.branchDetail!.longitude,
                                    ),
                                    name: state.branchDetail?.name ?? "",
                                    workingHours: state.branchDetail?.workTime ?? "",
                                    image: state.branchDetail!.images!.isNotEmpty
                                        ? state.branchDetail?.images!.first ?? ""
                                        : "",
                                  ),
                                ),
                              )
                              .then((_) => context.read<BottomNavBarController>().changeNavBar(true));
                        },
                        child: Container(
                          width: 343.w,
                          constraints: BoxConstraints(
                            minHeight: 40.h,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.h),
                          margin: EdgeInsets.symmetric(horizontal: 12.0.w),
                          decoration: BoxDecoration(
                            color: colors.neutral200,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              icons.location.svg(),
                              Expanded(
                                child: Text(
                                  widget.branch.address ?? 'address_not_available'.tr(),
                                  style: fonts.smallLink,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      8.h.verticalSpace,
                      Container(
                        width: 343.w,
                        constraints: BoxConstraints(minHeight: 44.h),
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.h),
                        margin: EdgeInsets.symmetric(horizontal: 12.0.w),
                        decoration: BoxDecoration(
                          color: colors.neutral200,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          spacing: 4.w,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 4.w),
                              child: icons.clock.svg(color: colors.darkMode900, height: 18.h, width: 18.w),
                            ),
                            Expanded(
                              child: Text(
                                widget.branch.workTime.isNotEmpty
                                    ? widget.branch.workTime
                                    : state.branchDetail?.workTime ?? '',
                                style: fonts.smallLink,
                              ),
                            )
                          ],
                        ),
                      ),
                      12.h.verticalSpace,
                      if (state.branchDetail != null && state.branchDetail?.description != null) ...{
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: WHtml(data: state.branchDetail!.description!),
                        ),
                      } else ...{
                        const SizedBox.shrink()
                      },
                      8.h.verticalSpace,
                      if (state.branchDetail?.images?.length != null && state.branchDetail!.images!.isNotEmpty) ...[
                        CarouselSlider(
                          items: List.generate(
                            state.branchDetail!.images!.length,
                            (i) {
                              final image = state.branchDetail!.images![i];
                              return WScaleAnimation(
                                onTap: () {
                                  final List<ContentBase> contentBaseList = state.branchDetail!.images!
                                      .where((item) => item.isNotEmpty)
                                      .map((item) => ContentBase(
                                            isVideo: false,
                                            fileLink: item,
                                            coverImage: item,
                                          ))
                                      .toList();

                                  MyFunctions.showImages(
                                    isLicence: true,
                                    context: context,
                                    mainImage: image,
                                    isVideo: false,
                                    images: [...contentBaseList],
                                  );
                                },
                                child: Padding(
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
                      12.h.verticalSpace,
                      if (state.branchDetail?.offers != null && state.branchDetail!.offers.isNotEmpty) ...[
                        12.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text("what_we_offer".tr(), style: fonts.regularMain),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 6.w,
                            children: [
                              ...List.generate(
                                state.branchDetail?.offers.length ?? 0,
                                (i) {
                                  List<OfferModel> offers = state.branchDetail?.offers.toList() ?? [];
                                  OfferModel model = offers[i];
                                  return Container(
                                    width: 190.w,
                                    height: 250.h,
                                    decoration: BoxDecoration(
                                      color: colors.shade0,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonImage(
                                          radius: BorderRadius.vertical(top: Radius.circular(10.r)),
                                          imageUrl: model.icon ?? "",
                                          width: double.infinity,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Text(model.name ?? '', maxLines: 2),
                                        ),
                                        12.h.verticalSpace,
                                        // WHtmlReadLessMore(
                                        //   data: model.description ?? "",
                                        //   isReadMore: true,
                                        // ),
                                        // Text(model.description ?? ''),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                      12.h.verticalSpace,
                      // if (state.branchDetail?.video?.isNotEmpty ?? false) ...[
                      //   12.h.verticalSpace,
                      //   Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 16.w),
                      //     child: Text("video".tr(), style: fonts.regularMain),
                      //   ),
                      //   SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(
                      //       children: [
                      //         ...List.generate(
                      //           state.branchDetail!.video?.length ?? 3,
                      //           (i) {
                      //             // final video = state.branchDetail!.video![i];
                      //             return Container(
                      //               constraints: BoxConstraints(minHeight: 0.3.sh),
                      //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      //             );
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   )
                      // ],
                      Licenses(
                        available: state.branchDetail?.licenses != null && state.branchDetail!.licenses!.isNotEmpty,
                        fonts: fonts,
                        state: state,
                        colors: colors,
                      ),
                      24.h.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          "address_branch".tr(),
                          style: fonts.regularMain.copyWith(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      16.h.verticalSpace,
                      WScaleAnimation(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return Container(
                                width: 1.sw,
                                decoration: BoxDecoration(
                                  color: colors.shade0,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                                constraints: BoxConstraints(maxHeight: 160.h),
                                child: Column(
                                  spacing: 8.h,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CButton(
                                      title: "Google",
                                      onTap: () {
                                        final lat = widget.branch.latitude;
                                        final lon = widget.branch.longitude;
                                        MyFunctions.openLink(
                                          "https://www.google.com/maps/search/?api=1&query=$lat,$lon",
                                        );
                                      },
                                    ),
                                    CButton(
                                      title: "Yandex",
                                      onTap: () {
                                        final lat = widget.branch.latitude;
                                        final lon = widget.branch.longitude;
                                        MyFunctions.openLink(
                                          "https://yandex.com/maps/?ll=$lon,$lat&z=14",
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 200.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: kYandexPlex != null
                                ? IgnorePointer(
                                    ignoring: true,
                                    child: YandexMap(
                                      mapObjects: _mapObjects,
                                      onMapCreated: (YandexMapController controller) async {
                                        _controller.complete(controller);
                                        await controller.moveCamera(
                                          CameraUpdate.newCameraPosition(kYandexPlex),
                                        );
                                      },
                                      onCameraPositionChanged: (position, reason, finished) {},
                                    ),
                                  )
                                : _buildMapPlaceholder(colors),
                          ),
                        ),
                      ),
                      16.h.verticalSpace,
                      DecoratedBox(
                        decoration: BoxDecoration(color: colors.shade0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0.h),
                          child: CButtonIcon(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            title: "call".tr(),
                            onTap: widget.branchPhoneNumberButton ?? () {},
                            iconPath: icons.phone,
                            textColor: colors.shade0,
                            iconColor: colors.shade0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
