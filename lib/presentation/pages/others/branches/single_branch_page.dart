import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/domain/sources/branches_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/branches/component/single_branch_info.dart';

import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/phone_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SingleBranchPage extends StatefulWidget {
  final List<String> branchPhotos;
  final String branchName;
  final String branchAdress;
  final String branchWorkingHours;
  final String branchInfoDescription;
  final String branchOfferTitle;
  final String branchOfferSubtitle;
  final VoidCallback branchPhoneNumberButton;

  const SingleBranchPage(
      {super.key,
      required this.branchPhotos,
      required this.branchName,
      required this.branchAdress,
      required this.branchWorkingHours,
      required this.branchInfoDescription,
      required this.branchOfferTitle,
      required this.branchOfferSubtitle,
      required this.branchPhoneNumberButton});

  @override
  State<SingleBranchPage> createState() => _SingleBranchPageState();
}

class _SingleBranchPageState extends State<SingleBranchPage> {
  final RefreshController _refreshController = RefreshController();
  bool isMoreInfo = false;
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
                blur: true,
                title: "branch".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace),
            Expanded(
                child: CustomListView(
                    loadingItemCount: 1,
                    refreshController: _refreshController,
                    onRefresh: () {
                      setState(() {});
                      _refreshController.refreshCompleted();
                    },
                    padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                    itemBuilder: (index, _) {
                      // final branch = branches[index];
                      return SingleBranchInfo(
                          branchPhoneNumberButton:
                              widget.branchPhoneNumberButton,
                          branchPhotos: widget.branchPhotos,
                          branchName: widget.branchName,
                          branchAdress: widget.branchAdress,
                          branchWorkingHours: widget.branchWorkingHours,
                          branchInfoDescription: widget.branchInfoDescription,
                          branchOfferTitle: widget.branchOfferTitle,
                          branchOfferSubtitle: widget.branchOfferSubtitle);
                    },
                    data: branches,
                    emptyWidgetModel:
                        ErrorWidgetModel(title: "title", subtitle: "subtitle"),
                    status: FormzSubmissionStatus.success))
          ],
        ),
      );
    });
  }
}
