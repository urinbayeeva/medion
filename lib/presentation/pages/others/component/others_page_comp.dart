import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/domain/sources/others_data.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/others/team/team_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/others_page_items_enum.dart';
import 'package:provider/provider.dart';

class OthersPageComp extends StatelessWidget {
  final List<OthersPageData> data;

  const OthersPageComp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8.r),
            border: Border(bottom: BorderSide(width: 1, color: colors.neutral400)),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              final String title = item.title;
              return Column(
                children: [
                  AnimationButtonEffect(
                    onTap: () async {
                      final bottomNavBarController = context.read<BottomNavBarController>();

                      Future<void> navigateTo(Route route) {
                        return Navigator.of(context, rootNavigator: true).push(route).then((_) {
                          bottomNavBarController.changeNavBar(false);
                        });
                      }

                      switch (item.checker) {
                        case OthersPageItemsEnum.article:
                          {
                            navigateTo(AppRoutes.getArticlePage());
                            break;
                          }
                        case OthersPageItemsEnum.branch:
                          {
                            navigateTo(AppRoutes.getBranchesPage());
                            break;
                          }

                        case OthersPageItemsEnum.equipment:
                          {
                            navigateTo(AppRoutes.getEquipmentPage());
                            break;
                          }
                        case OthersPageItemsEnum.aboutHealth:
                          {
                            navigateTo(AppRoutes.getAboutHealthPage());
                            break;
                          }
                        case OthersPageItemsEnum.partner:
                          {
                            navigateTo(AppRoutes.getPartnersPage());
                            break;
                          }
                        case OthersPageItemsEnum.awards:
                          {
                            navigateTo(AppRoutes.getAwardsPage());
                            break;
                          }
                        case OthersPageItemsEnum.career:
                          {
                            navigateTo(AppRoutes.getCareerPage());
                            break;
                          }
                        case OthersPageItemsEnum.services:
                          {
                            navigateTo(AppRoutes.getServicesPage());
                            break;
                          }
                        case OthersPageItemsEnum.offer:
                          {
                            navigateTo(AppRoutes.getOffertaPage());
                            break;
                          }
                        case OthersPageItemsEnum.activity:
                          {
                            navigateTo(AppRoutes.getActivityPage());
                            break;
                          }
                        case OthersPageItemsEnum.education:
                          {
                            navigateTo(AppRoutes.getEducationPage());
                            break;
                          }
                        case OthersPageItemsEnum.team:
                          {
                            navigateTo(MaterialPageRoute(builder: (context) => const TeamPage()));
                            break;
                          }

                        case OthersPageItemsEnum.checkUp:
                          {
                            print("Check Up");
                            break;
                          }
                        default:
                          {
                            navigateTo(AppRoutes.getUnderDevPage(appBarTitle: item.title));
                            break;
                          }
                      }

                      // switch (index) {
                      //   case 0:
                      //     navigateTo(AppRoutes.getArticlePage());
                      //     break;
                      //   case 1:
                      //     navigateTo(AppRoutes.getBranchesPage());
                      //     break;
                      //   case 2:
                      //     navigateTo(AppRoutes.getEquipmentPage());
                      //     break;
                      //   case 3:
                      //     navigateTo(AppRoutes.getAboutHealthPage());
                      //     break;
                      //   case 4:
                      //     navigateTo(AppRoutes.getPartnersPage());
                      //     break;
                      //   case 5:
                      //     navigateTo(AppRoutes.getAwardsPage());
                      //     break;
                      //   case 6:
                      //     navigateTo(AppRoutes.getCareerPage());
                      //   case 7:
                      //     navigateTo(AppRoutes.getServicesPage());
                      //   case 8:
                      //     navigateTo(AppRoutes.getOffertaPage());
                      //   case 9:
                      //     navigateTo(AppRoutes.getActivityPage());
                      //   case 10:
                      //     navigateTo(AppRoutes.getEducationPage());
                      //   case 11:
                      //     navigateTo(MaterialPageRoute(builder: (context) => const TeamPage()));
                      //   default:
                      //     navigateTo(AppRoutes.getUnderDevPage(appBarTitle: item["title"]));
                      //     break;
                      // }
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(item.icon),
                      title: Text(title.tr(), style: fonts.smallLink),
                    ),
                  ),
                  if (index != data.length - 1) Divider(color: colors.neutral400, height: 1),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
