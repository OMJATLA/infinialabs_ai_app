import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringFormField extends StatelessWidget {
  final int? minLength;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool isRequired;
  final String labelText;
  final String? helperText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?) onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final EdgeInsets scrollPadding;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? counterText;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool maxLenEnabled;
  final bool enableInteractiveSelection;
  final BoxConstraints? suffixIconConstraints;
  final bool? filled;
  final Color? fillColor;
  final bool obscureText;
  final bool? enabled;

  const StringFormField({
    super.key,
    this.minLength,
    this.maxLength,
    required this.labelText,
    this.helperText,
    this.hintText,
    required this.onChanged,
    this.onTap,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.isRequired = false,
    this.readOnly = false,
    this.scrollPadding = const EdgeInsets.all(20),
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.counterText = '',
    this.minLines,
    this.maxLines,
    this.autoFocus = false,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.floatingLabelBehavior,
    this.onFieldSubmitted,
    this.maxLenEnabled = false,
    this.enableInteractiveSelection = true,
    this.suffixIconConstraints,
    this.filled,
    this.fillColor,
    this.obscureText = false,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      enabled: enabled,
      initialValue: initialValue,
      focusNode: focusNode,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLenEnabled ? maxLength : null,
      autofocus: autoFocus,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefix: prefix,
        suffix: suffix,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: filled,
        fillColor: fillColor,
        suffixIconConstraints: suffixIconConstraints,
        labelText: labelText,
        floatingLabelBehavior: floatingLabelBehavior,
        hintText: hintText,
        helperText: helperText,
        counterText: counterText,
        alignLabelWithHint: true,
      ),
      onChanged: onChanged,
      onTap: onTap,
      scrollPadding: scrollPadding,
      onFieldSubmitted: onFieldSubmitted,
      validator: (val) {
        if (validator == null) {
          if (StringUtils.isNotNullOrEmpty(val)) {
            if (minLength != null) {
              if (val!.length < minLength!) {
                return 'Minimum $maxLength characters allowed';
              }
            }
            if (maxLength != null) {
              if (val!.length > maxLength!) {
                return 'Maximum $maxLength characters allowed';
              }
            }
          } else if (isRequired) {
            return "$labelText is required";
          }
          return null;
        } else {
          return validator!(val);
        }
      },
    );
  }
}
