import 'package:flutter/material.dart';

class IliaLayout {
  IliaLayout(this.context) {
    deviceHeight = MediaQuery.sizeOf(context).height;
    deviceWidth = MediaQuery.sizeOf(context).width;

    viewInsets = MediaQuery.viewInsetsOf(context);
    viewPadding = MediaQuery.viewPaddingOf(context);

    height = deviceHeight - (viewInsets.vertical + viewPadding.vertical);
    width = deviceWidth - (viewInsets.horizontal + viewPadding.horizontal);

    breakpoint = LayoutBreakpoint.medium;

    for (final value in LayoutBreakpoint.values) {
      if (width < value.size) {
        breakpoint = value;
        break;
      }
    }
  }

  final BuildContext context;
  late double deviceHeight;
  late double deviceWidth;
  late EdgeInsets viewInsets;
  late EdgeInsets viewPadding;
  late double height;
  late double width;
  late LayoutBreakpoint breakpoint;
}

enum LayoutBreakpoint {
  small,
  medium,
  large,
  extraLarge;

  double get size {
    return switch (this) {
      LayoutBreakpoint.small => 600,
      LayoutBreakpoint.medium => 900,
      LayoutBreakpoint.large => 1200,
      LayoutBreakpoint.extraLarge => 1600,
    };
  }
}
