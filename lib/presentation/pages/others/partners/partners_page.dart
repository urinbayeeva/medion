import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
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
              child: CustomListView(
                refreshController: _refreshController,
                onRefresh: () {
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
                              partnerName: partner["partner_name"],
                              partnerImage: partner["partner_icon"],
                              partnerUrl: partner["partner_web_site"],
                              partnerPhoneNumber:
                                  partner["partner_phone_number"],
                            ));
                      },
                      partnerImage: partner["partner_icon"],
                      parnterName: partner["partner_name"],
                      partnerSubtitle: partner["partner_subtitle"],
                    ),
                  );
                },
                data: partnersData,
                emptyWidgetModel: ErrorWidgetModel(
                  title: "title",
                  subtitle: "subtitle",
                ),
                status: FormzSubmissionStatus.success,
              ),
            ),
          ],
        ),
      );
    });
  }
}
