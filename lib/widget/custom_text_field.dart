import 'package:fastmov/widget/MaskedTextController.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final Function(String text)? onChanged;
  final String? hintText;
  final Widget? prefix;
  final Widget? sufix;
  final Widget? sufixButtom;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? autoFocus;
  final String? textLabel;
  final String? valorNoCampo;
  final EdgeInsets? padding;
  final int? widthInput;
  final Function? onClick;
  final int? maxLines;
  final int? minLines;
  final double radius;
  final double? contentPaddingTop;
  final MaskedTextController? mask;
  final TextEditingController? controlller;
  final String? suffixText;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final Color? borderColor;
  final Color? fillColor;
  final Color? iconColor;
  final int? maxLength;
  final bool? editable;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  const CustomTextField(
      {super.key,
      this.onChanged,
      this.hintText,
      this.prefix,
      this.sufix,
      this.autoFocus,
      this.inputType,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.textLabel,
      this.sufixButtom,
      this.valorNoCampo,
      this.padding,
      this.widthInput,
      this.onClick,
      this.maxLines,
      this.minLines,
      this.radius = 10,
      this.mask,
      this.controlller,
      this.suffixText,
      this.focusNode,
      this.textAlign = TextAlign.start,
      this.borderColor,
      this.maxLength,
      this.fillColor,
      this.editable,
      this.inputFormatters,
      this.contentPaddingTop,
      this.textInputAction,
      this.onEditingComplete,
      this.iconColor});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController?  textEditingController ;
 
  @override
  Widget build(BuildContext context) {
    var tamanhoPadraoLinha = 42.0;
    var tamanoRadius = widget.minLines == null ? widget.radius : 10.0;
    textEditingController ??= widget.controlller ??
        (widget.mask != null
            ? widget.mask!
            : widget.valorNoCampo != null
                ? TextEditingController(text: widget.valorNoCampo!)
                : null);
    textEditingController?.text = widget.valorNoCampo ?? textEditingController?.text ?? '';
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: widget.padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.textLabel != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CustomTextCaption1(
                          widget.textLabel ?? '', isHeavy: false,
                        ),
                      )
                    : Container(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: tamanhoPadraoLinha,
                      maxHeight: widget.minLines != null
                          ? tamanhoPadraoLinha * widget.minLines!
                          : tamanhoPadraoLinha),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        primaryColor: widget.iconColor == null
                            ? Theme.of(context).primaryColor
                            : widget.iconColor!),
                    child: TextField(
                      textCapitalization: widget.inputType == TextInputType.emailAddress ? TextCapitalization.none : TextCapitalization.sentences,
                      onEditingComplete: widget.onEditingComplete,
                      textInputAction: widget.textInputAction,
                      textAlign: widget.textAlign,
                      onTap: (widget.editable ?? true)
                          ? widget.onClick == null
                              ? null
                              : widget.onClick as void Function()
                          : null,
                      focusNode: (widget.editable ?? true)
                          ? widget.focusNode
                          : AlwaysDisabledFocusNode(),
                      maxLength: widget.maxLength,
                      inputFormatters: widget.inputFormatters,
                      controller:textEditingController,
                      readOnly: widget.onClick != null,
                      onChanged: widget.onChanged,
                      maxLines: (widget.obscureText ?? false) ? 1 : widget.maxLines,
                      minLines: (widget.obscureText ?? false) ? 1 : widget.minLines,
                      keyboardType: widget.inputType,
                      keyboardAppearance:
                           CustomLib.theme == ThemeMode.dark ? Brightness.dark : Brightness.light,
                      style:
                          CustomTextUtil.styleBody(isHeavy: true),
                      autofocus: widget.autoFocus ?? false,
                      obscureText: widget.obscureText ?? false,
                      decoration: InputDecoration(
                          counterText: '',
                          enabled: (widget.editable ?? true),
                          prefixIconConstraints:const BoxConstraints(minWidth: 35, maxHeight: 20),
                          contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: widget.contentPaddingTop != null
                                  ? widget.contentPaddingTop!
                                  : widget.minLines != null
                                      ? 5
                                      : 2),
                          prefix: widget.prefix,
                          suffix: widget.sufix,
                          suffixText: widget.suffixText,
                          suffixStyle: CustomTextUtil.styleCaption1(
                              isHeavy: true),
                          prefixIcon: widget.prefixIcon,
                          suffixIcon: widget.suffixIcon,
                          isDense: false,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(tamanoRadius)),
                            borderSide: BorderSide(
                                width: 1,
                                color: widget.borderColor != null
                                    ? widget.borderColor!
                                    : CustomLib.theme == ThemeMode.dark
                                  ? const Color(0xff424242)
                                  : const Color(0xffDCDDDF)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(tamanoRadius)),
                            borderSide: BorderSide(
                                width: 1,
                                color: widget.borderColor != null
                                    ? widget.borderColor!
                                    : CustomLib.theme == ThemeMode.dark
                                  ? const Color(0xff424242)
                                  : const Color(0xffDCDDDF)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(tamanoRadius)),
                            borderSide: BorderSide(
                                width: 1,
                                color: widget.borderColor != null
                                    ? widget.borderColor!
                                    : CustomLib.theme == ThemeMode.dark
                                  ? const Color(0xff424242)
                                  : const Color(0xffDCDDDF)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: widget.borderColor != null
                                    ? widget.borderColor!
                                    : CustomLib.theme == ThemeMode.dark
                                  ? const Color(0xff424242)
                                  : const Color(0xffDCDDDF)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(tamanoRadius),
                            ),
                          ),
                          filled: true,
                          hintStyle: CustomTextUtil.styleBody(
                              isHeavy: true),
                          hintText: widget.hintText ?? '',
                          fillColor: CustomLib.theme == ThemeMode.dark
                                  ? const Color(0xff202020)
                                  : const Color(0xffFFFFFF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.sufixButtom ?? Container(),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

