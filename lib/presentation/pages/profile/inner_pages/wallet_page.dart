import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientInfo());
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "wallet".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 26.w.horizontalSpace,
            ),
            24.h.verticalSpace,
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state.patientInfo == null) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Style.error500,
                      ),
                    ),
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 82.h,
                              padding: EdgeInsets.all(12.w),
                              margin: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: colors.shade0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("balance".tr(), style: fonts.smallLink),
                                  12.h.verticalSpace,
                                  Text(
                                    "sum".tr(namedArgs: {
                                      "amount":
                                          "${state.patientInfo?.patientBalance ?? 0}"
                                    }),
                                    style: fonts.regularMain,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 82.h,
                              padding: EdgeInsets.all(12.w),
                              margin: EdgeInsets.only(left: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: colors.shade0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("debit".tr(), style: fonts.smallLink),
                                  12.h.verticalSpace,
                                  Text(
                                    "sum".tr(namedArgs: {
                                      "amount":
                                          "${state.patientInfo?.patientDebit ?? 0}"
                                    }),
                                    style: fonts.regularMain,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.h.verticalSpace,
                      Container(
                        height: 82.h,
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: colors.shade0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("deposit".tr(), style: fonts.smallLink),
                            12.h.verticalSpace,
                            Text(
                              "sum".tr(namedArgs: {
                                "amount":
                                    "${state.patientInfo?.patientDeposit ?? 0}"
                              }),
                              style: fonts.regularMain,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
