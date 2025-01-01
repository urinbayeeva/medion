import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class CountDownComp extends StatefulWidget {
  final int seconds;
  final int refresh;
  final GestureTapCallback? onTap;

  const CountDownComp({
    super.key,
    required this.seconds,
    required this.onTap,
    required this.refresh,
  });

  @override
  State<CountDownComp> createState() => _CountDownCompState();
}

class _CountDownCompState extends State<CountDownComp> {
  late Timer _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
    startTimer();
  }

  @override
  void didUpdateWidget(covariant CountDownComp oldWidget) {
    if (widget.refresh != oldWidget.refresh) {
      _remainingSeconds = widget.seconds;
      startTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_remainingSeconds < 1) {
          timer.cancel();
        } else {
          _remainingSeconds--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return SizedBox(
        width: 244.w,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                semanticsLabel: 'you_can_get_new_code_through'.tr(),
                text: 'you_can_get_new_code_through'.tr(),
                style: fonts.smallMain.copyWith(
                  color: colors.neutral800,
                  fontSize: 15.sp,
                ),
              ),
              const TextSpan(
                text: " ",
              ),
              _remainingSeconds <= 0
                  ? TextSpan(
                      semanticsLabel: "get_code".tr(),
                      text: "get_code".tr(),
                      style: fonts.smallMain.copyWith(
                        color: colors.primary500,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = widget.onTap,
                    )
                  : TextSpan(
                      semanticsLabel:
                          '00:${_remainingSeconds < 10 ? "0$_remainingSeconds" : _remainingSeconds}',
                      text:
                          '00:${_remainingSeconds < 10 ? "0$_remainingSeconds" : _remainingSeconds}',
                      style: fonts.smallMain,
                    ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    });
  }
}
