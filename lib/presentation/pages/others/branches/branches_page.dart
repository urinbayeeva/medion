import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/domain/sources/branches_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/branches/component/branches_info.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/phone_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({super.key});

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
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
                title: "branches".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace),
            Expanded(
                child: CustomListView(
                    refreshController: _refreshController,
                    onRefresh: () {
                      setState(() {});
                      _refreshController.refreshCompleted();
                    },
                    padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                    itemBuilder: (index, _) {
                      final branch = branches[index];
                      return BranchesInfoCard(
                        branchPhoneNumberButton: () {
                          makePhoneCall(branch["branch_phone_number"]);
                        },
                        branchAdressButton: () {
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(true);
                          Navigator.push(context, AppRoutes.getMapPage())
                              .then((_) {
                            // ignore: use_build_context_synchronously
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(true);
                          });
                        },
                        branchMoreInfo: () {
                          print(
                              "Branch adress: ${branch['branch_adress']}, \n Branch name: ${branch['branch_name']}, \n Branch hours ${branch['branch_working_hours']}, \n Branch info: ${branch['branch_more_info']['branch_info_description']} \n Branch subtitle: ${branch['branch_more_info']['branch_offer_subtitle']}");
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(true);
                          Navigator.push(
                            context,
                            AppRoutes.getSingleBranchInfoPage(
                              branchPhotos: List<String>.from(
                                  branch['branch_more_info']['branch_photos']),
                              branchName: branch['branch_name'],
                              branchAdress: branch['branch_adress'],
                              branchWorkingHours:
                                  branch['branch_working_hours'],
                              branchInfoDescription: branch['branch_more_info']
                                  ['branch_info_description'],
                              branchOfferTitle: branch['branch_more_info']
                                  ['branch_offer_title'],
                              branchOfferSubtitle: branch['branch_more_info']
                                  ['branch_offer_subtitle'],
                              branchPhoneNumberButton: () {
                                makePhoneCall(branch['branch_phone_number']);
                              },
                            ),
                          ).then((_) {
                            // ignore: use_build_context_synchronously
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(true);
                          });
                        },
                        branchPhotos: List<String>.from(
                            branch['branch_more_info']['branch_photos']),
                        branchName: branch['branch_name'],
                        branchAdress: branch['branch_adress'],
                        branchPhoneNumber: branch['branch_phone_number'],
                        branchWorkingHours: branch['branch_working_hours'],
                      );
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
