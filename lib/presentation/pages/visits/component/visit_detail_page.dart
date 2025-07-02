import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/custom_sliver_header_delegate.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/component/admission.dart';
import 'package:medion/presentation/pages/visits/component/result.dart';
import 'package:medion/presentation/pages/visits/component/review.dart';
import 'package:medion/presentation/pages/visits/widgets/visit_info_detail_card.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/visits_enum.dart';

class VisitDetailPage extends StatefulWidget {
  final int id;
  final String? categoryName;
  final String? serviceName;
  final String? doctorName;
  final double? servicePrice;
  final String? visitDate;
  final String? visitLocation;
  final String? visitStatus;
  final String? visitPaymentByWhom;
  final String? paymentMethod;
  final dynamic data;
  final double longitude;
  final double latitude;
  final String image;
  final VoidCallback onTap;
  final VisitListEnum? status;

  const VisitDetailPage({
    super.key,
    this.categoryName,
    this.serviceName,
    this.doctorName,
    this.servicePrice,
    this.visitDate,
    this.visitLocation,
    this.visitStatus,
    this.visitPaymentByWhom,
    this.paymentMethod,
    this.data,
    required this.longitude,
    required this.latitude,
    required this.image,
    required this.onTap,
    this.status,
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
            title: Text(widget.categoryName!, style: fonts.regularMain),
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
              child: NestedScrollView(
                controller: _controller,
                physics: const AlwaysScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverPersistentHeader(
                    delegate: CustomSliverHeaderDelegate(
                      height: 180,
                      child: VisitInfoDetailCard(
                        categoryName: widget.categoryName,
                        serviceName: widget.serviceName,
                        doctorName: widget.doctorName,
                        servicePrice: 20,
                        visitStatus: widget.visitStatus,
                        visitDate: widget.visitDate,
                        visitPaymentByWhom: widget.visitPaymentByWhom,
                        paymentMethod: widget.paymentMethod,
                        data: widget.data,
                        visitLocation: widget.visitLocation,
                        image: widget.image,
                      ),
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
                body: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (o, n) {
                    final single = o.patientVisitSingle != n.patientVisitSingle;
                    final status = o.fetchPatientVisitSingleStatus != n.fetchPatientVisitSingleStatus;
                    return single || status;
                  },
                  builder: (context, state) {
                    return TabBarView(
                      children: [
                        AboutAdmission(
                          colors: colors,
                          press: () {},
                          status: widget.status!,
                          admission: widget.serviceName ?? "",
                          paymentType: widget.paymentMethod ?? "",
                          fonts: fonts,
                        ),
                        Result(
                          fonts: fonts,
                          docUrls: state.patientVisitSingle?.results?.toList() ?? [],
                          colors: colors,
                          icons: icons,
                        ),
                        Reviews(branch: widget.visitLocation ?? ""),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

final docs = <Map<String, dynamic>>[
  {"title": "анализ_кровь.pdf", "url": "", "date": "Чт, 17 Июля 2022"},
  {"title": "анализ_кровь.pdf", "url": "", "date": "Чт, 17 Июля 2022"},
  {"title": "анализ_кровь.pdf", "url": "", "date": "Чт, 17 Июля 2022"},
];
