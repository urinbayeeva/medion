import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/infrastructure/services/my_functions.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/component/admission.dart';
import 'package:medion/presentation/pages/visits/component/result.dart';
import 'package:medion/presentation/pages/visits/component/review.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_detail_card.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class VisitDetailPage extends StatefulWidget {
  final int id;

  final String? doctorName;
  final String? visitDate;
  final dynamic data;
  final String image;
  final VoidCallback onTap;

  const VisitDetailPage({
    super.key,
    this.doctorName,
    this.visitDate,
    this.data,
    required this.image,
    required this.onTap,
    required this.id,
  });

  @override
  State<VisitDetailPage> createState() => _VisitDetailPageState();
}

class _VisitDetailPageState extends State<VisitDetailPage> with AutomaticKeepAliveClientMixin {
  final ValueNotifier<int> _index = ValueNotifier(0);
  late final BranchBloc _branches;
  late final ScrollController _controller;

  @override
  void initState() {
    context.read<AuthBloc>().add(AuthEvent.fetchPatientVisitsDetail(id: widget.id));
    _branches = context.read<BranchBloc>();
    _branches.add(const BranchEvent.fetchBranches());
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (old, nyu) {
            final status = old.cancelVisitStatus != nyu.cancelVisitStatus;
            final result = old.cancelVisitResult != nyu.cancelVisitResult;
            return status || result;
          },
          listener: (context, state) {
            if (state.cancelVisitStatus.isSuccess) {
              context.read<AuthBloc>().add(const AuthEvent.fetchPatientVisits(time: ''));
              context
                  .showPopUp(
                status: PopUpStatus.success,
                message: "message",
                fonts: fonts,
                colors: colors,
                context: context,
              )
                  .then((value) {
                Navigator.of(context).pop();
              });
            }
            if (state.cancelVisitStatus.isFailure) {
              context.showPopUp(
                status: PopUpStatus.warning,
                message: "something_went_wrong".tr(),
                fonts: fonts,
                colors: colors,
                context: context,
              );
            }
          },
          buildWhen: (o, n) {
            final single = o.patientVisitSingle != n.patientVisitSingle;
            final status = o.fetchPatientVisitSingleStatus != n.fetchPatientVisitSingleStatus;
            final review = o.patientVisitSingle?.review != n.patientVisitSingle?.review;
            return single || status || review;
          },
          builder: (context, state) {
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
                title: Text(state.patientVisitSingle?.serviceType ?? '', style: fonts.regularMain),
              ),
              backgroundColor: colors.backgroundColor,
              body: DefaultTabController(
                length: 3,
                child: Listener(
                  onPointerUp: (_) {
                    if (_controller.offset > 0 && _controller.offset < 39) {
                      _controller.animateTo(0, duration: const Duration(milliseconds: 150), curve: Curves.linear);
                    } else if (_controller.offset > 39 && _controller.offset < 77) {
                      _controller.animateTo(77.5, duration: const Duration(milliseconds: 150), curve: Curves.linear);
                    }
                  },
                  onPointerCancel: (_) {
                    if (_controller.offset > 0 && _controller.offset < 38) {
                      _controller.animateTo(0, duration: const Duration(milliseconds: 150), curve: Curves.linear);
                    } else if (_controller.offset > 38 && _controller.offset < 77) {
                      _controller.animateTo(77.5, duration: const Duration(milliseconds: 150), curve: Curves.linear);
                    }
                  },
                  child: Builder(
                    builder: (context) {
                      final initial = state.fetchPatientVisitSingleStatus.isInitial;
                      final progress = state.fetchPatientVisitSingleStatus.isInProgress;
                      if (initial || progress) {
                        return const VisitSingleShimmer();
                      }

                      return NestedScrollView(
                        controller: _controller,
                        physics: const AlwaysScrollableScrollPhysics(),
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverToBoxAdapter(
                            child: VisitInfoDetailCard(
                              categoryName: "${state.patientVisitSingle?.categoryName}",
                              serviceName: "${state.patientVisitSingle?.serviceName}",
                              doctorName: "${widget.doctorName}",
                              servicePrice: 20,
                              visitStatus: "${state.patientVisitSingle?.visitStatus}",
                              visitDate: widget.visitDate,
                              visitPaymentByWhom: "${state.patientVisitSingle?.employerPays}",
                              paymentMethod: "${state.patientVisitSingle?.paymentMethod}",
                              data: widget.data,
                              visitLocation: "${state.patientVisitSingle?.address}",
                              image: widget.image,
                            ),
                          ),
                          SliverOverlapAbsorber(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                            sliver: SliverAppBar(
                              pinned: true,
                              backgroundColor: colors.backgroundColor,
                              automaticallyImplyLeading: false,
                              leadingWidth: 0,
                              title: ValueListenableBuilder(
                                valueListenable: _index,
                                builder: (context, val, ch) {
                                  return CustomTabbarBlack(
                                    onTap: (index) {
                                      _index.value = index;
                                    },
                                    selectedIndex: _index.value,
                                    padding: EdgeInsets.zero,
                                    labelPadding: EdgeInsets.zero,
                                    isScrollable: false,
                                    tabs: ["about_the_admission".tr(), "result".tr(), "reviews".tr()],
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                        body: TabBarView(
                          children: [
                            AboutAdmission(
                              colors: colors,
                              press: () {
                                context.read<AuthBloc>().add(
                                      AuthEvent.cancelVisit(id: state.patientVisitSingle!.id ?? 0),
                                    );
                              },
                              status: MyFunctions.getVisitStatus("${state.patientVisitSingle?.visitStatus}"),
                              admission: state.patientVisitSingle?.employerPays ?? "",
                              paymentType: "${state.patientVisitSingle?.paymentMethod}",
                              fonts: fonts,
                              lat: state.patientVisitSingle?.latitude ?? 41.32681,
                              lon: state.patientVisitSingle?.longitude ?? 69.24919,
                            ),
                            Result(
                              fonts: fonts,
                              docUrls: state.patientVisitSingle?.results?.toList() ?? [],
                              colors: colors,
                              icons: icons,
                            ),
                            // if (true && state.patientVisitSingle.visitStatus) ...{},
                            ListView(
                              children: [
                                Reviews(
                                  id: state.patientVisitSingle?.id ?? 0,
                                  colors: colors,
                                  icons: icons,
                                  fonts: fonts,
                                  review: state.patientVisitSingle?.review,
                                  isDone: state.patientVisitSingle?.isDone ?? false,
                                ),
                                const SizedBox(),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => false;
}

class VisitSingleShimmer extends StatelessWidget {
  const VisitSingleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            10.h.verticalSpace,
            ShimmerContainer(height: 120.h, borderRadius: 12.r),
            10.h.verticalSpace,
            ShimmerContainer(height: 40.h, borderRadius: 12.r),
            10.h.verticalSpace,
            ShimmerContainer(
              height: 120.h,
              borderRadius: 12.r,
            ),
            10.h.verticalSpace,
            SizedBox(
              height: 250.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => 10.w.horizontalSpace,
                itemBuilder: (context, index) {
                  return ShimmerContainer(
                    height: 250.h,
                    width: 180.w,
                    borderRadius: 12.r,
                  );
                },
              ),
            ),
            10.h.verticalSpace,
            ShimmerContainer(
              height: 120.h,
              borderRadius: 12.r,
            ),
          ],
        ),
      ),
    );
  }
}
