import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/partners/component/partners_card.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PartnersPage extends StatefulWidget {
  const PartnersPage({super.key});

  @override
  State<PartnersPage> createState() => _PartnersPageState();
}

class _PartnersPageState extends State<PartnersPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "partner"));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context.read<ContentBloc>().add(const ContentEvent.fetchContent(type: "partner"));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
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
            title: Text("partners".tr(), style: fonts.regularMain),
          ),
          backgroundColor: colors.backgroundColor,
          body: BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              try {
                if (state.fetchContentStatus.isInProgress || state.fetchContentStatus.isInitial) {
                  return Center(child: CircularProgressIndicator(color: colors.error500));
                }

                if (state.fetchContentStatus.isFailure) {
                  return Center(
                    child: Text('something_went_wrong'.tr(), style: fonts.regularSemLink),
                  );
                }

                final partnerContent = state.contentByType["partner"] ?? [];

                if (partnerContent.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icons.emojiSad.svg(width: 80.w, height: 80.h),
                        4.h.verticalSpace,
                        Text(
                          'no_result_found'.tr(),
                          style: fonts.regularSemLink,
                        ),
                      ],
                    ),
                  );
                }

                return SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  header: WaterDropMaterialHeader(
                    backgroundColor: colors.primary500,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        sliver: SliverToBoxAdapter(
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 16.h),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: partnerContent.length,
                            itemBuilder: (context, index) {
                              final partner = partnerContent[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: PartnersCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      AppRoutes.getPartnersInnerPage(
                                        partnerName: partner.title,
                                        partnerImages: partner.images.toList(),
                                        partnerTitle: partner.decodedDescription,
                                        partnerImage: partner.primaryImage,
                                        partnerUrl: partner.link.toString(),
                                        partnerPhoneNumber: partner.phoneNumber.toString(),
                                      ),
                                    );
                                  },
                                  partnerImage: partner.primaryImage,
                                  parnterName: partner.title,
                                  partnerSubtitle: partner.decodedDescription,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                debugPrint('Error in PartnersPage: $e');
                return Center(
                  child: Text('An error occurred: ${e.toString()}'),
                );
              }
            },
          ),
        );
      },
    );
  }
}
