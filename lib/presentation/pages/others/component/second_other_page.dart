import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/domain/sources/others_data.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/others/customer_review/customer_review.dart';
import 'package:medion/presentation/pages/others/docs/docs_page.dart';
import 'package:medion/presentation/pages/others/feedbacks/feedback_view.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/others_page_items_enum.dart';
import 'package:provider/provider.dart';

class SecondOthersPage extends StatelessWidget {
  final List<OthersPageData> data;

  const SecondOthersPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8.r),
            border: Border(
              bottom: BorderSide(width: 1, color: colors.neutral400),
            ),
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
                    onTap: () {
                      final bottomNavBarController = context.read<BottomNavBarController>();
                      bottomNavBarController.changeNavBar(true);

                      Future<void> navigateTo(Route route) {
                        return Navigator.of(context, rootNavigator: true).push(route).then(
                              (_) => bottomNavBarController.changeNavBar(false),
                            );
                      }

                      switch (item.checker) {
                        case OthersPageItemsEnum.discount:
                          {
                            navigateTo(AppRoutes.getDiscountPage());
                            break;
                          }
                        case OthersPageItemsEnum.review:
                          {
                            navigateTo(MaterialPageRoute(builder: (context) => const CustomerReview()));
                            break;
                          }
                        case OthersPageItemsEnum.feedback:
                          {
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
                            break;
                          }
                        case OthersPageItemsEnum.docs:
                          {
                            navigateTo(MaterialPageRoute(builder: (context) => const DocsPage()));
                            break;
                          }
                        default:
                          {
                            navigateTo(AppRoutes.getUnderDevPage(appBarTitle: title));
                            break;
                          }
                      }

                      // switch (item.checker) {
                      //   case OthersPageItemsEnum.article:
                      //     {}
                      //   case OthersPageItemsEnum.branch:
                      //     {}
                      //   case OthersPageItemsEnum.discount:
                      //     {}
                      //   case OthersPageItemsEnum.article:
                      //     {}
                      //   case OthersPageItemsEnum.article:
                      //     {}
                      //   case OthersPageItemsEnum.article:
                      //     {}

                      // case 0:
                      //   navigateTo(AppRoutes.getDiscountPage());
                      //   break;
                      // case 1:
                      //   navigateTo(MaterialPageRoute(builder: (context) => const CustomerReview()));
                      //   break;
                      // case 2:
                      //   {
                      //     showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return Dialog(
                      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      //           insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      //           // dialog margin
                      //           child: ConstrainedBox(
                      //             constraints: BoxConstraints(
                      //               maxHeight: MediaQuery.of(context).size.height * 0.52,
                      //             ),
                      //             child: const FeedbackView(),
                      //           ),
                      //         );
                      //       },
                      //     ).then((v) {
                      //       bottomNavBarController.changeNavBar(false);
                      //     });
                      //   }
                      // case 3:
                      //   navigateTo(MaterialPageRoute(builder: (context) => const DocsPage()));
                      //   break;
                      //
                      // default:
                      //   navigateTo(AppRoutes.getUnderDevPage(appBarTitle: title));
                      //   break;
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
