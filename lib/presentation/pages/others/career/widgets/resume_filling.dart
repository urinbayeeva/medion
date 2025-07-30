import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/profile/profile_bloc.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/others/career/data.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';

class ResumeFilling extends StatefulWidget {
  const ResumeFilling({
    super.key,
    this.jobTitle = '',
    this.hasBack = false,
    required this.bloc,
    required this.jobId,
    required this.compId,
  });

  final VacancyBloc bloc;
  final String jobTitle;
  final bool hasBack;
  final int jobId;
  final int compId;

  @override
  State<ResumeFilling> createState() => _ResumeFillingState();
}

class _ResumeFillingState extends State<ResumeFilling> {
  late final AuthBloc _profileBloc;
  final ValueNotifier<String> _title = ValueNotifier<String>("");
  final ValueNotifier<int> _size = ValueNotifier<int>(-1);
  late final FocusNode _nameFocusNode;
  late final FocusNode _lastNameFocusNode;
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _nameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _profileBloc = context.read<AuthBloc>();
    _nameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: ThemeWrapper(
        builder: (context, colors, fonts, icons, controller) {
          return BlocListener<VacancyBloc, VacancyState>(
            listenWhen: (o, n) {
              final pdf = o.selectPdf != n.selectPdf;
              final upload = o.uploadStatus != n.uploadStatus;
              return pdf || upload;
            },
            listener: (context, state) {
              _title.value = state.base64Pdf.title;
              _size.value = state.base64Pdf.size;

              if (state.selectPdf.isSuccess) {
                context.showPopUp(
                  colors: colors,
                  status: PopUpStatus.success,
                  message: "Selected file successfully".tr(),
                  fonts: fonts,
                  context: context,
                );
              }
              if (state.selectPdf.isFailure) {
                context.showPopUp(
                  colors: colors,
                  status: PopUpStatus.warning,
                  message: "No selected PDF file",
                  fonts: fonts,
                  context: context,
                );
              }
              if (state.uploadStatus.isFailure) {
                context.showPopUp(
                  colors: colors,
                  status: PopUpStatus.warning,
                  message: "something_went_wrong".tr(),
                  fonts: fonts,
                  context: context,
                );
              }
              if (state.uploadStatus.isSuccess) {
                showSuccess(icons: icons, colors: colors, fonts: fonts);
                _title.value = '';
                _size.value = -1;
              }
            },
            child: ValueListenableBuilder(
              valueListenable: _size,
              builder: (ctx, val, child) {
                final mb = formatBytes(_size.value, 2);
                debugPrint("Mb value = ${mb}");
                debugPrint("Mb value = ${_size.value}");
                return DecoratedBox(
                  decoration: BoxDecoration(color: colors.shade0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.w),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 4,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.jobTitle.isNotEmpty && widget.hasBack) ...[
                              AppBar(
                                backgroundColor: Colors.transparent,
                                centerTitle: true,
                                automaticallyImplyLeading: false,
                                actions: [
                                  WScaleAnimation(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: icons.cancel.svg(height: 24.h, width: 24.w),
                                  ),
                                ],
                                title: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "reply_to_vacancy".tr(),
                                        style: fonts.mediumMain,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        widget.jobTitle,
                                        style: fonts.regularLink,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ] else ...[
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "didnt_find_vacancy".tr(),
                                      style: fonts.mediumLink,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "upload_your_resume_and_your_contacts".tr(),
                                      style: fonts.regularLink,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            ],
                            SizedBox(height: 8.h),
                            Text("name".tr(), style: fonts.regularText),
                            CustomTextField(
                              focusNode: _nameFocusNode,
                              controller: _nameController,
                              onChanged: (value) {},
                              hintText: 'enter_your_name'.tr(),
                            ),
                            SizedBox(height: 8.h),
                            Text("second_name".tr(), style: fonts.regularText),
                            CustomTextField(
                              focusNode: _lastNameFocusNode,
                              controller: _lastNameController,
                              onChanged: (value) {},
                              hintText: 'enter_your_second_name'.tr(),
                            ),
                            SizedBox(height: 8.h),
                            Text("resume".tr(), style: fonts.regularText),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: (mb > 15) ? colors.error500 : colors.neutral100),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 8,
                                    children: [
                                      icons.document.svg(width: 48.w, height: 56.h),
                                      ValueListenableBuilder(
                                        valueListenable: _title,
                                        builder: (context, value, child) {
                                          if (_title.value.isNotEmpty || _title.value.length > 3) {
                                            return Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                spacing: 4,
                                                children: [
                                                  SizedBox(
                                                    width: 1.sw,
                                                    child: Text(
                                                      _title.value,
                                                      style: fonts.regularText,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  Text(convertKbToMb(_size.value), style: fonts.regularText),
                                                  if (mb > 15) ...{
                                                    Text(
                                                      "Large size of File please select another file",
                                                      style: fonts.regularMain.copyWith(color: colors.error500),
                                                    )
                                                  }
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Text("file_max_size".tr(), style: fonts.regularText);
                                          }
                                        },
                                      ),
                                      CButton(
                                        title: "upload_resume".tr(),
                                        backgroundColor: colors.neutral100,
                                        textColor: colors.darkMode900,
                                        onTap: () async {
                                          final base64Pdf = await pickPdfAndConvertToBase64();
                                          if (base64Pdf.title.isNotEmpty || base64Pdf.size != -1) {
                                            widget.bloc.add(VacancyEvent.selectPdf(base64Pdf: base64Pdf));
                                          }
                                        },
                                        child: widget.bloc.state.selectPdf.isInProgress
                                            ? const Center(child: CupertinoActivityIndicator())
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            CButton(
                              title: "reply".tr(),
                              onTap: () {
                                if (mb > 16) {
                                  context.showPopUp(
                                    status: PopUpStatus.warning,
                                    message: "High size of File",
                                    fonts: fonts,
                                    colors: colors,
                                    context: context,
                                  );

                                  return;
                                }

                                final base64 = widget.bloc.state.base64Pdf;
                                final name = _nameController.text;
                                final lName = _lastNameController.text;
                                final phone = _profileBloc.state.patientInfo!.phoneNumber;
                                final enablePhone = phone != null && phone.isNotEmpty;
                                if (base64.base64.length > 5 && name.isNotEmpty && lName.length > 3 && enablePhone) {
                                  final model = UploadVacancyModel(
                                    (b) => b
                                      ..id = widget.jobId
                                      ..companyId = widget.compId
                                      ..name = name
                                      ..lastName = lName
                                      ..phone = phone
                                      ..resume = widget.bloc.state.base64Pdf.base64,
                                  );

                                  widget.bloc.add(VacancyEvent.uploadVacancy(vacancy: model));
                                  _lastNameController.clear();
                                  _nameController.clear();
                                } else if (name.length < 3 || lName.length < 3) {
                                  context.showPopUp(
                                    status: PopUpStatus.warning,
                                    message: "Name or Last name is Empty",
                                    fonts: fonts,
                                    colors: colors,
                                    context: context,
                                  );
                                } else if (enablePhone) {
                                  context.showPopUp(
                                    status: PopUpStatus.warning,
                                    message: "Phone Number Error $phone",
                                    fonts: fonts,
                                    colors: colors,
                                    context: context,
                                  );
                                } else {
                                  context.showPopUp(
                                    status: PopUpStatus.warning,
                                    message: "No Selected Pdf",
                                    fonts: fonts,
                                    colors: colors,
                                    context: context,
                                  );
                                }
                              },
                              child: (widget.bloc.state.uploadStatus.isInProgress)
                                  ? const Center(child: CupertinoActivityIndicator())
                                  : null,
                            ),
                            if (widget.hasBack) ...{
                              SizedBox(height: 4.h),
                            } else ...{
                              SizedBox(height: 20.h),
                            },
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void showSuccess({
    required IconSet icons,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
              decoration: BoxDecoration(color: colors.shade0),
              child: Column(
                spacing: 6.h,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icons.donePay.svg(height: 48.h, width: 48.w),
                  10.h.verticalSpace,
                  Text("thank_you_for_replying".tr(), style: fonts.regularMain),
                  Text(
                    "we_saved_your_resume".tr(),
                    textAlign: TextAlign.center,
                    style: fonts.xSmallMain.copyWith(color: const Color(0xff323232)),
                  ),
                  10.h.verticalSpace,
                  CButton(
                    title: "Окей",
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return 0;
    final i = (log(bytes) / log(1024)).floor();
    final size = (bytes / pow(1024, i)).toStringAsFixed(decimals);
    return double.tryParse(size) ?? 0;
  }

  String convertKbToMb(num kilobytes, {int decimals = 2}) {
    if (kilobytes <= 0) return "0 MB";
    final i = (log(kilobytes) / log(1024)).floor();
    final size = (kilobytes / pow(1024, i)).toStringAsFixed(decimals);
    return "$size MB";
  }

  Future<FileInfo> pickPdfAndConvertToBase64() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      final fileName = result.files.single.name;
      final filePath = result.files.single.path!;
      final size = result.files.single.size;
      final file = File(filePath);
      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);
      final fileInfo = FileInfo(title: fileName, base64: base64String, size: size, path: filePath);

      return fileInfo;
    } else {
      return const FileInfo();
    }
  }
}
