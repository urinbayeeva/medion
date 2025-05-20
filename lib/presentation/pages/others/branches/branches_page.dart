import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/domain/sources/branches_data.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/home/yandex_on_tap.dart';
import 'package:medion/presentation/pages/map/map_with_polylines.dart';
import 'package:medion/presentation/pages/others/branches/component/branches_info.dart';
import 'package:medion/presentation/pages/others/branches/component/single_branch_info.dart';
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
                  if (state.loading) {}

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
                          yandexButton: () {
                            launchYandexTaxi(
                                context, branch.latitude, branch.longitude);
                          },
                          branchPhoneNumberButton: () {
                            makePhoneCall(branch.phone!);
                          },
                          branchAdressButton: () {
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapWithPolylines(
                                        destination: LatLng(
                                            branch.latitude, branch.longitude),
                                        name: branch.name ?? "",
                                        workingHours: branch.workTime,
                                        image: branch.image ?? ""))).then((_) {
                              context
                                  .read<BottomNavBarController>()
                                  .changeNavBar(true);
                            });
                          },
                          branchMoreInfo: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleBranchInfo(
                                          lang: branch.longitude,
                                          lat: branch.latitude,
                                          branchPhotos: branch.image ?? "",
                                          branchName: branch.name ?? "No Name",
                                          branchAdress: branch.address ?? "",
                                          branchWorkingHours: branch.workTime,
                                          branchInfoDescription:
                                              branch.description ?? "",
                                          branchOfferTitle: "",
                                          branchOfferSubtitle: "",
                                          branchPhoneNumberButton: () {
                                            makePhoneCall(branch.phone ?? "");
                                          },
                                        )));
                          },
                          branchPhotos: branch.image ?? "",
                          branchName: branch.name ?? "N/A",
                          branchAdress: branch.address ?? "",
                          branchPhoneNumber: branch.phone ?? "",
                          branchWorkingHours: branch.workTime ?? "N/A",
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
