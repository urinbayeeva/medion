import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/domain/sources/partners_info.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/partners/component/partners_card.dart';
import 'package:medion/presentation/routes/routes.dart';
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
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "partner"));
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "partners".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                return CustomListView(
                  refreshController: _refreshController,
                  onRefresh: () {
                    context
                        .read<ContentBloc>()
                        .add(const ContentEvent.fetchContent(type: "partner"));
                    setState(() {});
                    _refreshController.refreshCompleted();
                  },
                  padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                  itemBuilder: (index, _) {
                    final partner = partnersData[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: PartnersCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              AppRoutes.getPartnersInnerPage(
                                partnerName: state.content[index].title,
                                partnerImage: state.content[index].primaryImage,
                                partnerUrl: state.content[index].link as String,
                                partnerPhoneNumber:
                                    state.content[index].phoneNumber as String,
                              ));
                        },
                        partnerImage: state.content[index].primaryImage,
                        parnterName: state.content[index].title,
                        partnerSubtitle: state.content[index].description,
                      ),
                    );
                  },
                  data: state.content,
                  emptyWidgetModel: ErrorWidgetModel(
                    title: "title",
                    subtitle: "subtitle",
                  ),
                  status: FormzSubmissionStatus.success,
                );
              }),
            )
          ],
        ),
      );
    });
  }
}
