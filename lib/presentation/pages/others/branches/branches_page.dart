import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/sources/branches_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/branches/component/branches_info.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/style.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<BranchBloc>().add(const BranchEvent.fetchBranches());
  }

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
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: BlocBuilder<BranchBloc, BranchState>(
                builder: (context, state) {
                  if (state.loading) {
                    // return const Center(child: CircularProgressIndicator());
                  } else if (state.error) {
                    return Center(child: Text("Error loading branches"));
                  } else if (state.success && state.branches.isEmpty) {
                    return const Center(child: Text("No branches found"));
                  }

                  return SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    header: const WaterDropMaterialHeader(
                      color: Style.shade0,
                      backgroundColor: Style.error500,
                    ),
                    onRefresh: () {
                      context
                          .read<BranchBloc>()
                          .add(const BranchEvent.fetchBranches());
                      _refreshController.refreshCompleted();
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                      itemCount: state.branches.length,
                      itemBuilder: (context, index) {
                        final branch = state.branches[index];

                        return BranchesInfoCard(
                          branchPhoneNumberButton: () {
                            makePhoneCall(branch.phone!);
                          },
                          branchAdressButton: () {
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(true);
                            Navigator.push(context, AppRoutes.getMapPage())
                                .then((_) {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                            });
                          },
                          branchMoreInfo: () {
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(true);
                            Navigator.push(
                              context,
                              AppRoutes.getSingleBranchInfoPage(
                                branchPhotos: [],
                                branchName: branch.name ?? "No Name",
                                branchAdress: branch.address ?? "",
                                branchWorkingHours: branch.workTime,
                                branchInfoDescription: branch.description ?? "",
                                branchOfferTitle: "",
                                branchOfferSubtitle: "",
                                branchPhoneNumberButton: () {
                                  makePhoneCall(branch.phone ?? "");
                                },
                              ),
                            ).then((_) {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                            });
                          },
                          branchPhotos: [],
                          branchName: branch.name ?? "No Name",
                          branchAdress: branch.address ?? "",
                          branchPhoneNumber: branch.phone ?? "",
                          branchWorkingHours: branch.workTime,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
