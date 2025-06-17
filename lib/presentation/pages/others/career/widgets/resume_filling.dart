import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_text_field.dart';
import 'package:medion/presentation/pages/others/career/data.dart';
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
                  message: "Upload Successful".tr(),
                  fonts: fonts,
                  context: context,
                );
              }
              if (state.selectPdf.isFailure) {
                context.showPopUp(
                  colors: colors,
                  status: PopUpStatus.warning,
                  message: "no selected PDF file",
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
                _title.value = '';
                _size.value = -1;
              }
            },
            child: DecoratedBox(
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
                          Center(
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
                          )
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
                            border: Border.all(color: colors.neutral100),
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            spacing: 4,
                                            children: [
                                              Text(_title.value, style: fonts.regularText),
                                              Text(convertKbToMb(_size.value), style: fonts.regularText),
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
                            final base64 = widget.bloc.state.base64Pdf;
                            final name = _nameController.text;
                            final lName = _lastNameController.text;
                            if (base64.title.isNotEmpty &&
                                base64.base64.length > 5 &&
                                name.length > 3 &&
                                lName.length > 3) {
                              final model = UploadVacancyModel(
                                (b) => b
                                  ..id = widget.jobId
                                  ..companyId = widget.compId
                                  ..name = name
                                  ..lastName = lName
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
                            } else {
                              // popUp for pdf
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
            ),
          );
        },
      ),
    );
  }

  String convertKbToMb(num kilobytes, {int fractionDigits = 2}) {
    final mb = (kilobytes / 100) / 1024;
    return "${mb.toStringAsFixed(fractionDigits)} MB";
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
