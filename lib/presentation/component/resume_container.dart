import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_file_upload_container.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/component/phone_number_component.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/extensions.dart';

class ResumeContainer extends StatefulWidget {
  final Future<String?> Function() fileUploadOnTap;

  const ResumeContainer({super.key, required this.fileUploadOnTap});

  @override
  State<ResumeContainer> createState() => _ResumeContainerState();
}

class _ResumeContainerState extends State<ResumeContainer> {
  late GlobalKey<FormState> _formKey;

  late TextEditingController _phoneNumberController;
  late TextEditingController _nameController;
  late FocusNode focusNode;
  String? uploadedFileName;

  @override
  void initState() {
    _phoneNumberController = TextEditingController(text: "+998 ");
    _nameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _nameController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        decoration: BoxDecoration(
            color: colors.shade0, borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "not_found_vacancy".tr(),
              style: fonts.regularLink
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            2.h.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              "leave_resume_contact".tr(),
              style: fonts.regularLink.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: colors.neutral600),
            ),
            12.h.verticalSpace,
            CustomTextField(
              controller: _nameController,
              hintText: "name".tr(),
            ),
            12.h.verticalSpace,
            CustomTextField(
              controller: _nameController,
              hintText: "second_name".tr(),
            ),
            12.h.verticalSpace,
            Form(
              key: _formKey,
              child: CustomTextField(
                // focusNode: focusNode,
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
              ),
            ),
            12.h.verticalSpace,
            uploadedFileName == null
                ? CFileUploadContainer(
                    onTap: () async {
                      String? fileName = await widget.fileUploadOnTap();
                      if (fileName != null) {
                        setState(() {
                          uploadedFileName = fileName;
                        });
                      }
                    },
                  )
                : Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colors.shade0,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: colors.neutral400, width: 2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.insert_drive_file, color: colors.primary500),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            uploadedFileName!,
                            style: fonts.regularLink.copyWith(fontSize: 14.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: colors.error500),
                          onPressed: () {
                            setState(() {
                              uploadedFileName = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
