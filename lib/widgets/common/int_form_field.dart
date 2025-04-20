import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntFormField extends StatelessWidget {
  final int? minVal;
  final int? maxVal;
  final int? maxLength;
  final int? minLength;
  final bool isRequired;
  final String? labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?) onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final EdgeInsets scrollPadding;
  final EdgeInsets? contentPadding;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? helperText;
  final bool autofocus;
  final void Function()? onEditingComplete;
  final String? counterText;
  final bool disableNegativeValue;
  final TextAlign textAlign;
  final bool enabled;

  const IntFormField({
    super.key,
    this.minVal,
    this.maxVal,
    this.maxLength,
    this.labelText,
    required this.onChanged,
    this.onTap,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.isRequired = false,
    this.readOnly = false,
    this.scrollPadding = const EdgeInsets.all(20),
    this.contentPadding,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.validator,
    this.textInputAction,
    this.autofocus = false,
    this.onEditingComplete,
    this.counterText = ' ',
    this.disableNegativeValue = false,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.minLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      textAlign: textAlign,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: readOnly,
      initialValue: initialValue,
      focusNode: focusNode,
      controller: controller,
      autofocus: autofocus,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labelText,
        prefix: prefix,
        suffix: suffix,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        helperText: helperText,
        counterText: counterText,
      ),
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
      ),
      onTap: onTap,
      scrollPadding: scrollPadding,
      textInputAction: textInputAction,
      onEditingComplete:
          onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
      validator: (val) {
        if (validator != null) {
          return validator!(val);
        }
        if (StringUtils.isNotNullOrEmpty(val)) {
          final intVal = int.tryParse(val!);
          if (intVal == null) {
            return 'Invalid value';
          }
          if (minVal != null) {
            if (intVal < minVal!) {
              return 'Greater than $minVal value required';
            }
          }
          if (maxVal != null) {
            if (intVal > maxVal!) {
              return 'Less than $maxVal value required';
            }
          }
          if (maxLength != null) {
            if (val.length > maxLength!) {
              return 'Maximum $maxLength characters allowed';
            }
          }
          if (minLength != null) {
            if (val.length < minLength!) {
              return '$minLength characters required';
            }
          }
          if (disableNegativeValue) {
            if (intVal < 0) {
              return '$labelText can\'t be negative';
            }
          }
        } else if (isRequired) {
          return "${labelText ?? "Value"} is required";
        }

        return null;
      },
    );
  }
}
