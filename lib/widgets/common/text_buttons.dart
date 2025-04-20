import 'package:flutter/material.dart';
import 'package:infinialabs_ai/theme/app_colors.dart';

class TextButton1 extends StatelessWidget {
  const TextButton1({
    super.key,
    this.onPressed,
    required this.widget,
    this.margin,
    this.color,
    this.disabledColor,
    this.useFullWidth = true,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0),
    this.radius,
    this.tapTargetSize,
    this.borderColor,
  });

  final Function()? onPressed;
  final Widget widget;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? color;
  final Color? borderColor;
  final Color? disabledColor;
  final double? radius;
  final bool useFullWidth;
  final MaterialTapTargetSize? tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      width: useFullWidth ? MediaQuery.of(context).size.width : null,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(color: borderColor ?? AppColors.colorTransparent),
          ),
          tapTargetSize: tapTargetSize,
          backgroundColor: WidgetStatePropertyAll(color),
          padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => padding,
          ),
          shape:
              radius == null
                  ? null
                  : WidgetStateProperty.resolveWith<OutlinedBorder>(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius!),
                    ),
                  ),
        ),
        child: widget,
      ),
    );
  }
}

class TextButton1Progress extends StatelessWidget {
  final EdgeInsets? margin;

  const TextButton1Progress({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: margin ?? const EdgeInsets.all(16),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
