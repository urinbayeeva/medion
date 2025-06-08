import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_outlined_button.dart';
import 'package:medion/presentation/pages/profile/inner_pages/payment_history_widget.dart';
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
    // Trigger wallet data fetch when page loads
    context.read<AuthBloc>().add(const AuthEvent.fetchMyWallet());
  }

  String _formatNumber(String numberString) {
    final number = double.tryParse(numberString) ?? 0;
    return number
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )
        .trim();
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
            Expanded(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state.isFetchingPatientInfo) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.primary500,
                      ),
                    );
                  }

                  if (state.errorFetchingPatientInfo) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('failed_to_load_wallet'.tr()),
                          16.h.verticalSpace,
                          CustomButton(
                            onPressed: () => context.read<AuthBloc>().add(
                                  const AuthEvent.fetchMyWallet(),
                                ),
                            title: 'retry'.tr(),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state.myWallet == null) {
                    return Center(
                      child: Text('no_wallet_data'.tr()),
                    );
                  }

                  final wallet = state.myWallet!;

                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Wallet Cards
                        Row(
                          children: [
                            _buildWalletCard(
                              context,
                              colors,
                              fonts,
                              title: "balance".tr(),
                              amount: wallet.patientBalance?.toInt() ?? 0,
                            ),
                            8.w.horizontalSpace,
                            _buildWalletCard(
                              context,
                              colors,
                              fonts,
                              title: "debit".tr(),
                              amount: wallet.patientDebit?.toInt() ?? 0,
                            ),
                          ],
                        ),
                        8.h.verticalSpace,
                        Row(
                          children: [
                            _buildWalletCard(
                              context,
                              colors,
                              fonts,
                              title: "deposit".tr(),
                              amount: wallet.patientDeposit?.toInt() ?? 0,
                            ),
                            8.w.horizontalSpace,
                            _buildWalletCard(
                              context,
                              colors,
                              fonts,
                              title: "cacheback".tr(),
                              amount: 0,
                            ),
                          ],
                        ),

                        /// Payment History
                        if (wallet.payments.isEmpty)
                          SizedBox.shrink()
                        else
                          ListView.separated(
                            padding: EdgeInsets.only(top: 24.h),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: wallet.payments.length,
                            separatorBuilder: (_, __) => 12.h.verticalSpace,
                            itemBuilder: (context, index) {
                              final payment = wallet.payments[index];
                              return PaymentHistoryWidget(
                                moveId: payment.moveId ?? "",
                                createDate: payment.createDate ?? '',
                                displayAmount: payment.displayAmount ?? 0,
                                createUser: payment.createUser ?? '',
                              );
                            },
                          ),
                        100.h.verticalSpace,
                      ],
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

  Widget _buildWalletCard(
    BuildContext context,
    colors,
    fonts, {
    required String title,
    required int amount,
  }) {
    return Expanded(
      child: Container(
        height: 82.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: fonts.smallLink),
            12.h.verticalSpace,
            Text(
              "sum".tr(namedArgs: {
                "amount": _formatNumber(amount.toString()),
              }),
              style: fonts.regularMain,
            ),
          ],
        ),
      ),
    );
  }
}
