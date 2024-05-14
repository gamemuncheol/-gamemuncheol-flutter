import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingBuilder {
  EdgeInsets _padding = const EdgeInsets.all(0);
  late final Widget _child;

  PaddingBuilder indexMethod() {
    return this;
  }

  PaddingBuilder setPadding({
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) {
    _padding = EdgeInsets.only(
      left: left ?? (horizontal == null ? 0 : horizontal / 2),
      right: right ?? (horizontal == null ? 0 : horizontal / 2),
      top: top ?? (vertical == null ? 0 : vertical / 2),
      bottom: bottom ?? (vertical == null ? 0 : vertical / 2),
    );

    return this;
  }

  Padding setChild(Widget child) {
    _child = child;

    return Padding(
      padding: _padding.copyWith(
        left: _padding.left.w,
        right: _padding.right.w,
        top: _padding.top.h,
        bottom: _padding.bottom.h,
      ),
      child: _child,
    );
  }
}
