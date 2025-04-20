import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final bool isRequired;
  final String labelText;
  final String? initialValue;
  final TextEditingController? controller;

  final void Function(String?) onChanged;
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
  final String? helperText;
  final TextInputAction? textInputAction;

  const EmailFormField({
    super.key,
    required this.labelText,
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
    this.counterText,
    this.autoFocus = false,
    this.textInputAction = TextInputAction.next,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: initialValue,
      focusNode: focusNode,
      controller: controller,
      autofocus: autoFocus,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        helperText: helperText,
        prefix: prefix,
        suffix: suffix,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        counterText: counterText,
      ),
      onChanged: onChanged,
      onTap: onTap,
      scrollPadding: scrollPadding,
      validator: (val) {
        if (StringUtils.isNotNullOrEmpty(val)) {
          final emailValid = EmailUtils.isEmail(val!);
          if (!emailValid) {
            return 'Invalid Email';
          }
        } else if (isRequired) {
          return "$labelText is required";
        }
        return null;
      },
    );
  }
}
