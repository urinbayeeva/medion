import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
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
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("wallet".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (ctx, state) {
              if (state.isFetchingPatientInfo) {
                return Center(child: CupertinoActivityIndicator(color: colors.error500));
              }

              if (state.errorFetchingPatientInfo || state.myWallet == null) {
                return Center(
                  child: EmptyState(
                    title: "",
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'failed_to_load_wallet'.tr(),
                          style: fonts.regularMain,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                          child: CButton(
                            height: 40.h,
                            onTap: () => context.read<AuthBloc>().add(const AuthEvent.fetchMyWallet()),
                            title: 'retry'.tr(),
                          ),
                        ),
                        16.h.verticalSpace,
                      ],
                    ),
                  ),
                );
              }

              final wallet = state.myWallet!;

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                    if (wallet.payments.isEmpty) ...{
                      Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: EmptyState(
                          title: "no_result_found".tr(),
                        ),
                      )
                    } else ...{
                      10.h.verticalSpace,
                      Text("История платежей", style: fonts.regularMain),
                      10.h.verticalSpace,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.myWallet?.payments.length ?? 0,
                        separatorBuilder: (_, __) => 12.h.verticalSpace,
                        itemBuilder: (ctx, index) {
                          final tr = state.myWallet!.payments[index];
                          return Column(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(color: colors.backgroundColor),
                                child: SizedBox(
                                  height: 32,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(tr.date ?? "",
                                          style: fonts.xSmallText.copyWith(color: const Color(0xff596066))),
                                      Text(
                                        "sum".tr(namedArgs: {"amount": _formatNumber(tr.totalAmount.toString())}),
                                        style: fonts.xSmallText.copyWith(color: const Color(0xff596066)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ...List.generate(
                                tr.transactions.length,
                                (i) {
                                  final transaction = tr.transactions[i];
                                  return WScaleAnimation(
                                    onTap: () {
                                      openDetail(
                                        colors: colors,
                                        fonts: fonts,
                                        icons: icons,
                                        name: transaction.name ?? '',
                                        accountNumber: transaction.invoiceName ?? '',
                                        date: transaction.dateTime ?? "",
                                        paymentMethod: transaction.paymentMethod ?? '',
                                        inKass: transaction.cashier ?? "",
                                        status: transaction.status ?? "",
                                        payment: transaction.accountNumber.toString(),
                                        fiscalCheck: transaction.fiscalCheck ?? '',
                                        paymentCheck: transaction.paymentCheck ?? '',
                                        amount: "${transaction.amount}",
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      margin: const EdgeInsets.symmetric(vertical: 4),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: colors.shade0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            spacing: 8,
                                            children: [
                                              Container(
                                                height: 28,
                                                width: 28,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: transaction.isIncome ?? false
                                                      ? colors.success500.withValues(alpha: 0.2)
                                                      : colors.error500.withValues(alpha: 0.2),
                                                ),
                                                child: Transform.rotate(
                                                  angle: transaction.isIncome ?? false ? pi / 2 : -pi / 2,
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    size: 22,
                                                    color: transaction.isIncome ?? false
                                                        ? colors.success500
                                                        : colors.error500,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    transaction.name ?? "",
                                                    style: fonts.smallTagSecond.copyWith(fontSize: 14),
                                                  ),
                                                  Text(style: fonts.xSmallText, transaction.paymentMethod ?? ''),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "+${_formatNumber(transaction.amount.toString())}",
                                                style: fonts.smallTagSecond.copyWith(
                                                  fontSize: 14,
                                                  color: transaction.isIncome ?? false
                                                      ? colors.success500
                                                      : colors.error500,
                                                ),
                                              ),
                                              if (transaction.dateTime != null &&
                                                  transaction.dateTime!.length >= 16) ...{
                                                Text(
                                                  transaction.dateTime!.substring(0, 16),
                                                  style: fonts.xSmallText.copyWith(color: const Color(0xff596066)),
                                                ),
                                              } else ...{
                                                Text(
                                                  transaction.dateTime ?? "",
                                                  style: fonts.xSmallText.copyWith(color: const Color(0xff596066)),
                                                ),
                                              }
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    }
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildWalletCard(BuildContext context, colors, fonts, {required String title, required int amount}) {
    return Expanded(
      child: Container(
        height: 82.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colors.shade0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: fonts.smallLink),
            Text(
              "sum".tr(namedArgs: {"amount": _formatNumber(amount.toString())}),
              style: fonts.smallMain,
            ),
          ],
        ),
      ),
    );
  }

  void openDetail({
    required CustomColorSet colors,
    required FontSet fonts,
    required IconSet icons,
    required String name,
    required String accountNumber,
    required String date,
    required String paymentMethod,
    required String inKass,
    required String status,
    required String payment,
    required String fiscalCheck,
    required String paymentCheck,
    required String amount,
  }) {
    showModalBottomSheet(
      useSafeArea: true,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: PaymentSingle(
            name: name,
            accountNumber: accountNumber,
            date: date,
            paymentMethod: paymentMethod,
            inKass: inKass,
            status: status,
            payment: payment,
            fiscalCheck: fiscalCheck,
            paymentCheck: paymentCheck,
            amount: amount,
          ),
        );
      },
    );
  }
}

class PaymentSingle extends StatelessWidget {
  const PaymentSingle({
    super.key,
    required this.name,
    required this.accountNumber,
    required this.date,
    required this.paymentMethod,
    required this.inKass,
    required this.status,
    required this.payment,
    required this.fiscalCheck,
    required this.paymentCheck,
    required this.amount,
  });

  final String name;
  final String accountNumber;
  final String date;
  final String paymentMethod;
  final String inKass;
  final String status;
  final String payment;
  final String fiscalCheck;
  final String paymentCheck;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              Align(
                alignment: Alignment.center,
                child: Divider(
                  thickness: 2.5,
                  indent: MediaQuery.of(context).size.width * 0.42,
                  endIndent: MediaQuery.of(context).size.width * 0.42,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(name, style: fonts.regularMain),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF2F4F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    10.verticalSpace,
                    withDivider(title: "Номер счета:", value: accountNumber, fonts: fonts, hasDivider: true),
                    10.verticalSpace,
                    withDivider(title: "Дата:", value: date, fonts: fonts, hasDivider: true),
                    10.verticalSpace,
                    withDivider(title: "Метод оплаты:", value: paymentMethod, fonts: fonts, hasDivider: true),
                    10.verticalSpace,
                    withDivider(title: "Кассир:", value: inKass, fonts: fonts, hasDivider: true),
                    10.verticalSpace,
                    withDivider(title: "Статус:", value: status, fonts: fonts, hasDivider: false),
                    10.verticalSpace,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF2F4F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 57,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Оплачено:", style: fonts.xSmallMain),
                    Text("sum".tr(namedArgs: {"amount": amount}), style: fonts.regularMain),
                  ],
                ),
              ),
              1.verticalSpace,
              IgnorePointer(
                ignoring: paymentCheck.isEmpty,
                child: WScaleAnimation(
                  onTap: () async {
                    // debugPrint("Payment check : $paymentCheck");
                    // MyFunctions.openLink(paymentCheck);
                    final service = FileDownloadService();

                    await service.downloadPDFWithProgress(
                      context: context,
                      url: paymentCheck,
                      fileName: name,
                      colors: colors,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: colors.shade0,
                      border: Border.all(color: (paymentCheck.isEmpty) ? colors.neutral300 : colors.error100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (paymentCheck.isEmpty) ? colors.neutral300 : colors.error500,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: icons.paymentCheck.svg(width: 20, height: 20, color: colors.shade0),
                              ),
                            ),
                          ),
                          Text("Платежный чек", style: fonts.xSmallMain)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              50.verticalSpace
            ],
          ),
        );
      },
    );
  }

  Widget withDivider({required String title, required String value, bool hasDivider = false, required FontSet fonts}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 3,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: fonts.xSmallMain.copyWith(fontSize: 14, color: const Color(0xff62626E))),
            Text(value, style: fonts.smallText.copyWith(fontSize: 14)),
          ],
        ),
        if (hasDivider) ...{const Divider()}
      ],
    );
  }
}

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: path,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      backgroundColor: Colors.grey,
      onRender: (_pages) {
        // setState(() {
        //   pages = _pages;
        //   isReady = true;
        // });
      },
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        // _controller.complete(pdfViewController);
      },
      onPageChanged: (page, total) {
        print('page change: $page/$total');
      },
    );
  }
}
