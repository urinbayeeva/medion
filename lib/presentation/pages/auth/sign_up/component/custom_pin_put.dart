import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart' show CodeAutoFill;

class CustomPinFieldAutoFill extends StatefulWidget {
  final int codeLength;
  final bool autoFocus;
  final TextEditingController? controller;
  final String? currentCode;
  final Function(String)? onCodeSubmitted;
  final Function(String?)? onCodeChanged;
  final PinDecoration? decoration;
  final FocusNode? focusNode;
  final Cursor? cursor;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enableInteractiveSelection, enabled;
  final String? smsCodeRegexPattern;
  final List<TextInputFormatter>? inputFormatters;

  const CustomPinFieldAutoFill(
      {super.key,
      this.keyboardType = const TextInputType.numberWithOptions(),
      this.textInputAction = TextInputAction.done,
      this.focusNode,
      this.cursor,
      this.inputFormatters,
      this.enableInteractiveSelection = true,
      this.enabled = true,
      this.controller,
      this.decoration,
      this.onCodeSubmitted,
      this.onCodeChanged,
      this.currentCode,
      this.autoFocus = false,
      this.codeLength = 6,
      this.smsCodeRegexPattern});

  @override
  State<StatefulWidget> createState() {
    return _CustomPinFieldAutoFillState();
  }
}

class _CustomPinFieldAutoFillState extends State<CustomPinFieldAutoFill>
    with CodeAutoFill {
  late TextEditingController controller;
  bool _shouldDisposeController = false;

  @override
  Widget build(BuildContext context) {
    return PinInputTextField(
      enabled: widget.enabled,
      pinLength: widget.codeLength,
      decoration: widget.decoration ??
          UnderlineDecoration(
              colorBuilder: const FixedColorBuilder(Colors.black),
              textStyle: const TextStyle(color: Colors.black)),
      focusNode: widget.focusNode,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      autocorrect: false,
      cursor: widget.cursor,
      autofillHints: const <String>[AutofillHints.oneTimeCode],
      textCapitalization: TextCapitalization.none,
      contextMenuBuilder: (context, editableTextState) {
        final List<ContextMenuButtonItem> buttonItems =
            editableTextState.contextMenuButtonItems;
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: editableTextState.contextMenuAnchors,
          buttonItems: buttonItems,
        );
      },
      keyboardType: widget.keyboardType,
      autoFocus: widget.autoFocus,
      controller: controller,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      onSubmit: widget.onCodeSubmitted,
    );
  }

  @override
  void initState() {
    _shouldDisposeController = widget.controller == null;
    controller = widget.controller ?? TextEditingController(text: '');
    code = widget.currentCode;
    codeUpdated();
    controller.addListener(() {
      if (controller.text != code) {
        code = controller.text;
        if (widget.onCodeChanged != null) {
          widget.onCodeChanged!(code);
        }
      }
    });
    listenForCode(smsCodeRegexPattern: widget.smsCodeRegexPattern);
    super.initState();
  }

  @override
  void didUpdateWidget(CustomPinFieldAutoFill oldWidget) {
    if (widget.controller != null && widget.controller != controller) {
      controller.dispose();
      controller = widget.controller!;
    }

    if (widget.currentCode != oldWidget.currentCode ||
        widget.currentCode != code) {
      code = widget.currentCode;
      codeUpdated();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void codeUpdated() {
    if (controller.text != code) {
      controller.value = TextEditingValue(text: code ?? '');
      if (widget.onCodeChanged != null) {
        widget.onCodeChanged!(code ?? '');
      }
    }
  }

  @override
  void dispose() {
    cancel();
    if (_shouldDisposeController) {
      controller.dispose();
    }
    unregisterListener();
    super.dispose();
  }
}
