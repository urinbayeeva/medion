import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/others/customer_review/customer_review.dart';
import 'package:medion/presentation/pages/others/docs/docs_page.dart';
import 'package:medion/presentation/pages/others/feedbacks/feedback_view.dart';
import 'package:medion/presentation/pages/others/team/team_page.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class OthersPageComp extends StatelessWidget {
  final List data;

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
              return Column(
                children: [
                  AnimationButtonEffect(
                    onTap: () async {
                      final bottomNavBarController = context.read<BottomNavBarController>();
                      bottomNavBarController.changeNavBar(true);

                      Future<void> navigateTo(Route route) {
                        return Navigator.push(context, route).then((_) {
                          bottomNavBarController.changeNavBar(false);
                        });
                      }

                      switch (index) {
                        case 0:
                          navigateTo(AppRoutes.getArticlePage());
                          break;
                        case 1:
                          navigateTo(AppRoutes.getBranchesPage());
                          break;
                        case 2:
                          navigateTo(AppRoutes.getEquipmentPage());
                          break;
                        case 3:
                          navigateTo(AppRoutes.getAboutHealthPage());
                          break;
                        case 4:
                          navigateTo(AppRoutes.getPartnersPage());
                          break;
                        case 5:
                          navigateTo(AppRoutes.getAwardsPage());
                          break;
                        case 6:
                          navigateTo(AppRoutes.getCareerPage());
                        case 7:
                          navigateTo(AppRoutes.getDiscountPage());
                        case 8:
                          navigateTo(AppRoutes.getServicesPage());
                        case 9:
                          navigateTo(AppRoutes.getOffertaPage());
                        case 10:
                          navigateTo(AppRoutes.getActivityPage());
                        case 11:
                          navigateTo(AppRoutes.getEducationPage());
                        case 12:
                          navigateTo(MaterialPageRoute(builder: (context) => const TeamPage()));
                        case 13:
                          navigateTo(MaterialPageRoute(builder: (context) => const CustomerReview()));
                        case 14:
                          {
                            // navigateTo(MaterialPageRoute(builder: (context) => const FeedbackView()));
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                                  // dialog margin
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: MediaQuery.of(context).size.height * 0.52,
                                    ),
                                    child: const FeedbackView(),
                                  ),
                                );
                              },
                            ).then((v) {
                              bottomNavBarController.changeNavBar(false);
                            });
                          }
                        case 15:
                          navigateTo(MaterialPageRoute(builder: (context) => const DocsPage()));

                        default:
                          navigateTo(AppRoutes.getUnderDevPage(appBarTitle: item["title"]));
                          break;
                      }
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(item['icon']),
                      title: Text(item['title'], style: fonts.smallLink),
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
