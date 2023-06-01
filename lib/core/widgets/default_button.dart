import 'package:flutter/material.dart';
import 'package:products_task/core/constants/extensions.dart';

import '../constants/app_radius.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isUpperCase = true,
      this.textStyle});

  final VoidCallback onPressed;
  final String text;
  final bool isUpperCase;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side:
            BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 2),
      ),
      onPressed: onPressed,
      child: Text(
        isUpperCase ? text.toString().toUpperCase() : text,
        style: textStyle ?? context.theme.textTheme.titleMedium,
      ),
    );
  }
}

class DefaultButtonWithTextWidget extends StatelessWidget {
  const DefaultButtonWithTextWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isUpperCase = true,
      this.textStyle});

  final VoidCallback onPressed;
  final String text;
  final bool isUpperCase;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r10),
      ),
      color: Theme.of(context).secondaryHeaderColor,
      onPressed: onPressed,
      child: Text(
        isUpperCase ? text.toString().toUpperCase() : text,
        style: textStyle ?? context.theme.textTheme.titleMedium,
      ),
    );
  }
}
