import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_not_available.dart';
import 'package:medion/presentation/component/c_radio_tile.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/c_zigzag_container.dart';
import 'package:medion/presentation/pages/appointment/component/user_info_widget.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedOption = "";
  String _selectedPayment = "Payme";
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Expanded(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const UserInfoWidget(title: "Ваши данные", children: [
              CustomTextField(
                padding: EdgeInsets.only(bottom: 12),
                hintText: "Введите имя",
                title: "Имя",
              ),
              CustomTextField(
                padding: EdgeInsets.only(bottom: 12),
                hintText: "Введите фамилию",
                title: "Фамилия",
              ),
              CustomTextField(
                padding: EdgeInsets.only(bottom: 12),
                hintText: "0000",
                title: "ID",
              ),
              CustomTextField(
                padding: EdgeInsets.only(bottom: 12),
                hintText: "+998 90 000 00 00",
                title: "Телефон для связи",
              )
            ]),
            12.h.verticalSpace,
            UserInfoWidget(title: "Ваши приёмы", children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                    color: colors.shade0,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(width: 1, color: colors.neutral400)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Диагностика",
                          style: fonts.smallMain.copyWith(
                              color: colors.primary900,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        AnimationButtonEffect(
                            onTap: () {},
                            child: icons.cancel.svg(width: 16.w, height: 16.h))
                      ],
                    ),
                    4.h.verticalSpace,
                    Text(
                      "Гинекологическое УЗИ",
                      style: fonts.xSmallMain.copyWith(
                          color: colors.neutral600,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    8.h.verticalSpace,
                    Divider(
                      color: colors.neutral400,
                    ),
                    8.h.verticalSpace,
                    Text(
                      "Б. Наргиза Акбаровна",
                      style: fonts.smallMain.copyWith(
                          color: colors.primary900,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    4.h.verticalSpace,
                    Text(
                      "200  000 cум",
                      style: fonts.xSmallMain.copyWith(
                          color: colors.neutral600,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    8.h.verticalSpace,
                    Divider(
                      color: colors.neutral400,
                    ),
                    8.h.verticalSpace,
                    Row(
                      children: [
                        icons.clock.svg(width: 14.w, height: 14.h),
                        4.w.horizontalSpace,
                        Text(
                          "Среда, 22 Июня, 14:30",
                          style: fonts.xSmallMain.copyWith(
                              color: colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    4.h.verticalSpace,
                    Row(
                      children: [
                        icons.location.svg(width: 14.w, height: 14.h),
                        4.w.horizontalSpace,
                        Text(
                          "Шайхантахур, А. Кодирий 39",
                          style: fonts.xSmallMain.copyWith(
                              color: colors.primary900,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
            12.h.verticalSpace,
            UserInfoWidget(title: "Кто оплачивает приём", children: [
              CustomRadioTile<String>(
                value: "Сам",
                groupValue: _selectedOption,
                title: const Text("Сам"),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              CustomRadioTile<String>(
                value: "Работодатель",
                groupValue: _selectedOption,
                title: Text(
                  "Работодатель",
                  style: fonts.headlineMain
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              CustomRadioTile<String>(
                value: "Страховая компания",
                groupValue: _selectedOption,
                title: Text(
                  "Страховая компания",
                  style: fonts.headlineMain
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
            ]),
            12.h.verticalSpace,
            UserInfoWidget(title: "Способ оплаты", children: [
              Row(
                children: [
                  Expanded(
                    child: CustomRadioTile<String>(
                      value: "Payme",
                      groupValue: _selectedPayment,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          icons.payme.asset(width: 24.w, height: 24.h),
                          4.w.horizontalSpace,
                          Text(
                            "Payme",
                            style: fonts.headlineMain.copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedPayment = value!;
                        });
                      },
                    ),
                  ),
                  8.w.horizontalSpace,
                  Expanded(
                    child: CustomRadioTile<String>(
                      value: "Click",
                      groupValue: _selectedPayment,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          icons.click.svg(width: 24.w, height: 24.h),
                          4.w.horizontalSpace,
                          Text(
                            "Click",
                            style: fonts.headlineMain.copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      onChanged: (value) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: colors.shade0,
                                content: const CNotAvailable(),
                              );
                            });
                      },
                    ),
                  ),
                ],
              )
            ]),
            12.h.verticalSpace,
            CZigZagContainer(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
              color: colors.shade0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ваш чек",
                    style: fonts.regularSemLink.copyWith(
                        color: colors.primary900,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  12.h.verticalSpace,
                  Text(
                    "1. УЗИ диагностика",
                    style: fonts.smallMain.copyWith(
                        color: colors.neutral600,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  8.h.verticalSpace,
                  Text(
                    "2 x 200 000 _ _ _ _ _ _ _ _ _ _ _ _ 400 000 сум",
                    style: fonts.xSmallMain.copyWith(
                        color: colors.neutral600,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  8.h.verticalSpace,
                  Text("в т.ч. НДС 15% _ _ _ _ _ _ _ _ _ _ _60 000 сум",
                      style: fonts.xSmallMain.copyWith(
                          color: colors.neutral600,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400)),
                  8.h.verticalSpace,
                  Text("Итого _ _ _ _ _ _ _ _ _ _ _ _ _ _460 000 сум",
                      style: fonts.xSmallMain.copyWith(
                          color: colors.neutral600,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            )),
            12.h.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Если вы вносите предоплату ',
                    style: TextStyle(
                      color: colors.neutral600,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '15% онлайн, ',
                    style: TextStyle(
                      color: colors.secondary900,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text:
                        'оставшуюся сумму оплачиваете перед посещением врача в клинике',
                    style: TextStyle(
                      color: colors.neutral600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: colors.shade0,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  CButton(
                      title: "Внести предоплату (15%) - 69 000 сум",
                      onTap: () {},
                      backgroundColor: colors.neutral200,
                      textColor: colors.secondary900),
                  8.h.verticalSpace,
                  CButton(title: "Оплатить всю сумму", onTap: () {}),
                ],
              ),
            ),
            24.h.verticalSpace,
          ]),
        ),
      ));
    });
    
  }
}
