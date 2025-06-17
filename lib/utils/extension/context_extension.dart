import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension BuildContexExtension on BuildContext {
  Future<void> showPopUp({
    required PopUpStatus status,
    required String message,
    required FontSet fonts,
    required CustomColorSet colors,
    Widget? child,
    double? height,
    Duration? displayDuration,
    Duration? animationDuration,
    Duration? reverseAnimationDuration,
    DismissType? dismissType,
    TextStyle? messageStyle,
    required BuildContext context,
  }) async {
    if (status == PopUpStatus.error || status == PopUpStatus.warning) {
      if (Platform.isIOS) {
        await HapticFeedback.lightImpact();
      } else {
        // await Vibration.vibrate(duration: 200, amplitude: 64);
      }
    }
    AnimationController? localAnimationController;
    showTopSnackBar(
      Overlay.of(this),
      child ??
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4).copyWith(right: 0),
            height: height,
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F24).withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SvgPicture.asset(status.icon),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message,
                    style: messageStyle ?? fonts.regularLink.copyWith(color: colors.shade0),
                  ),
                ),
                WScaleAnimation(
                  onTap: () {
                    if (localAnimationController != null) {
                      localAnimationController!.reverse();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      "assets/icons/cancel.svg",
                      colorFilter: const ColorFilter.mode(
                        Color(0xffD2D5DC),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      displayDuration: displayDuration ?? const Duration(milliseconds: 2100),
      dismissDirection: [DismissDirection.vertical, DismissDirection.horizontal],
      dismissType: dismissType ?? DismissType.onTap,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeIn,
      onAnimationControllerInit: (p0) => localAnimationController = p0,
      animationDuration: animationDuration ?? const Duration(milliseconds: 400),
      reverseAnimationDuration: reverseAnimationDuration ?? const Duration(milliseconds: 300),
    );
  }
}
