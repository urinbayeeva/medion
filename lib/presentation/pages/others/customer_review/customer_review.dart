import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/others/customer_review/review_card.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CustomerReview extends StatefulWidget {
  const CustomerReview({super.key});

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  late final TextEditingController _controller;

  @override
  void initState() {
    context.read<BranchBloc>().add(const BranchEvent.getReviews());
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return BlocBuilder<BranchBloc, BranchState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: colors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  spacing: 1.h,
                  children: [
                    CAppBar(
                      title: "customers_reviews".tr(),
                      isBack: true,
                      showBottomBar: true,
                      centerTitle: true,
                      trailing: AnimationButtonEffect(
                        onTap: () {},
                        child: icons.filter.svg(width: 20.w, height: 20.h),
                      ),
                    ),
                    BlocBuilder<BranchBloc, BranchState>(
                      builder: (context, state) {
                        if (state.getReviewStatus.isFailure) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 120),
                            child: Center(child: CupertinoActivityIndicator(color: Colors.green)),
                          );
                        }
                        if (state.getReviewStatus.isInProgress || state.getReviewStatus.isInitial) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 120),
                            child: Center(child: CupertinoActivityIndicator(color: Colors.green)),
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(color: colors.shade0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 12,
                                    children: [
                                      Text("customers_reviews".tr(), style: fonts.regularMain),
                                      CustomTextField(
                                        controller: _controller,
                                        onChanged: (value) {},
                                        hintText: 'search_for_doctors'.tr(),
                                      ),
                                      const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ...List.generate(
                              reviews.length,
                              (i) {
                                final review = reviews[i];
                                return ReviewCard(review: review, colors: colors, icons: icons, fonts: fonts);
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

const reviews = <CustomerReviewModel>[
  CustomerReviewModel(
    name: 'Алишер',
    rating: 4,
    title: '',
    description:
        'Отношение чуткое. Внимательно на все. Профессионал своего дела, любит свою работу и со всей ответственностью относится к ней. Самый лучший! Желаю Вам здоровья, семейного благополучия, долгих лет жизни. Низкий Вам поклон!',
    location: 'Ул. Зульфияхонум 18 - Medion Clinics, Aesthetic & SPA',
    dateTime: '10.12.2022',
  ),
  CustomerReviewModel(
    name: 'Диана',
    rating: 5,
    title: '',
    description: 'Очень довольна визитом! Профессионально, аккуратно и с заботой. Спасибо большое врачу!',
    location: 'Medion Clinics',
    dateTime: '15.01.2023',
  ),
  CustomerReviewModel(
    name: 'Игорь',
    rating: 3,
    title: '',
    description: 'Все хорошо, но приём начался с опозданием. В остальном всё понравилось.',
    location: 'Ул. Зульфияхонум 18',
    dateTime: '20.11.2022',
  ),
  CustomerReviewModel(
    name: 'Наргиза',
    rating: 5,
    title: '',
    description: 'Очень внимательный врач! Слушает пациента, все объясняет. Рекомендую.',
    location: 'Medion Clinics, Aesthetic & SPA',
    dateTime: '22.02.2023',
  ),
  CustomerReviewModel(
    name: 'Бобур',
    rating: 4,
    title: '',
    description: 'Мне все понравилось. Персонал вежливый, врач опытный.',
    location: 'Ул. Зульфияхонум 18',
    dateTime: '05.03.2023',
  ),
  CustomerReviewModel(
    name: 'Анастасия',
    rating: 5,
    title: '',
    description: 'Всё на высшем уровне! Спасибо доктору за внимательность и профессионализм.',
    location: 'Medion Clinics',
    dateTime: '11.04.2023',
  ),
  CustomerReviewModel(
    name: 'Жасур',
    rating: 4,
    title: '',
    description: 'Немного дороговато, но уровень обслуживания на отлично. Рекомендую.',
    location: 'Aesthetic & SPA',
    dateTime: '01.05.2023',
  ),
  CustomerReviewModel(
    name: 'Севара',
    rating: 5,
    title: '',
    description: 'Самая лучшая клиника в городе! Спасибо большое.',
    location: 'Ул. Зульфияхонум 18 - Medion Clinics',
    dateTime: '12.06.2023',
  ),
];

class CustomerReviewModel {
  final String name;
  final int rating;
  final String title;
  final String description;
  final String location;
  final String dateTime;

  const CustomerReviewModel({
    this.name = '',
    this.rating = -1,
    this.title = '',
    this.description = '',
    this.location = '',
    this.dateTime = '',
  });
}
