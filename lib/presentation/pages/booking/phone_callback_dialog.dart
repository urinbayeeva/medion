import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/phone_number_component.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhoneCallbackDialog extends StatefulWidget {
  final List<int> serviceIds;

  const PhoneCallbackDialog({
    super.key,
    required this.serviceIds,
  });

  @override
  State<PhoneCallbackDialog> createState() => _PhoneCallbackDialogState();
}

class _PhoneCallbackDialogState extends State<PhoneCallbackDialog> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController(text: "+998 ");
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _submitCallback() async {
    final phone = _phoneNumberController.text;
    final response = await http.post(
      Uri.parse('${Constants.baseUrlP}/help/call'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': phone,
        'service_ids': widget.serviceIds,
      }),
    );

    Navigator.of(context).pop();

    if (response.statusCode == 200) {
      _showSuccessDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ошибка отправки данных")),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ThemeWrapper(
            builder: (context, colors, fonts, icons, controller) {
          return AlertDialog(
            backgroundColor: colors.shade0,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/done.svg"),
                8.h.verticalSpace,
                Text("Заявка оставлена", style: fonts.mediumMain),
                4.h.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  "В скором времени мы вам перезвоним по поводу вашей заявки",
                  style: fonts.xSmallMain,
                ),
                30.h.verticalSpace,
                CButton(
                  title: "back".tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return AlertDialog(
        backgroundColor: colors.shade0,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Обратный звонок".tr(),
                style: fonts.mediumMain,
              ),
            ),
            12.h.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              "Оставьте свой номер телефона и мы вам перезвоним".tr(),
              style: fonts.xSmallMain.copyWith(fontSize: 14.sp),
            ),
            12.h.verticalSpace,
            Text("contact_phone_number".tr(), style: fonts.regularLink),
            CustomTextField(
              autoFocus: true,
              title: "",
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (value.length >= 17) {
                  setState(() {});
                }
              },
              controller: _phoneNumberController,
              formatter: <TextInputFormatter>[InternationalPhoneFormatter()],
              hintText: '+998',
              validator: (String? text) {},
            ),
            30.h.verticalSpace,
            CButton(
              title: "send".tr(),
              onTap: _submitCallback,
            ),
          ],
        ),
      );
    });
  }
}
