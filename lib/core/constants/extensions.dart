import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension AppSizeExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension NaviagtionExtension on BuildContext {
  void navigateTo(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }

  void navigateToNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void navigateToAndRemoveUntil(
    Widget widget,
  ) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => widget), (route) => false);
  }

  void navigateToAndRemoveUntilNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false,
        arguments: arguments);
  }

  void naviagtorPop() {
    Navigator.of(this).pop();
  }
}
