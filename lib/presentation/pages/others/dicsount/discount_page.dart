import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/article/widgets/article_card_widget.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  @override
  void initState() {
    context
        .read<ContentBloc>()
        .add(const ContentEvent.fetchContent(type: "discount"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "discounts".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                if (state.error) {
                  return Center(
                      child: Text('something_went_wrong'.tr(),
                          style: fonts.regularSemLink));
                }

                return Column(
                  children: [
                    12.h.verticalSpace,
                    SizedBox(
                      height: 300.h,
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: state.content.length,
                        itemBuilder: (context, index) {
                          final discount = state.content[index];
                          return ArticleCardWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  AppRoutes.getDiscountPageView(
                                    imagePath: discount.primaryImage,
                                    title: discount.title,
                                    desc: discount.description,
                                    discountAddress:
                                        discount.discountLocation.toString(),
                                    discountDuration:
                                        "${discount.discountStartDate.toString()} - ${discount.discountEndDate.toString()}",
                                    phoneShortNumber:
                                        discount.phoneNumberShort.toString(),
                                    phoneNumber:
                                        discount.phoneNumber.toString(),
                                  ));
                            },
                            title: discount.title,
                            description: discount.description,
                            image: discount.primaryImage,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
