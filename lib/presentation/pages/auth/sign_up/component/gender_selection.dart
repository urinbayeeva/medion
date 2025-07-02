import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/pages/auth/sign_up/component/gender_enum.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class GenderSelection extends StatefulWidget {
  final Gender selectedGender;
  final ValueChanged<Gender> onGenderSelected;

  const GenderSelection({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  late Gender selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Gender.values.map((gender) {
          final isChecked = selectedGender == gender;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.zero,
              child: AnimationButtonEffect(
                onTap: () {
                  setState(() {
                    selectedGender = gender;
                    widget.onGenderSelected(gender);
                  });
                },
                child: Container(
                  height: 50.h, // Set a fixed height
                  padding: EdgeInsets.only(left: 12.w),
                  decoration: BoxDecoration(
                    color: colors.secondary800,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: colors.neutral400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        gender == Gender.men ? 'man'.tr() : 'woman'.tr(),
                        style: fonts.regularText.copyWith(
                          color: colors.primary900,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        semanticsLabel: gender == Gender.men ? 'Men selected' : 'Women selected',
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              selectedGender = gender;
                              widget.onGenderSelected(gender);
                            });
                          }
                        },
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          return isChecked ? colors.error500 : colors.shade0;
                        }),
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
