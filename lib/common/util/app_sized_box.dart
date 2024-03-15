import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedBoxBuilder {
  double? _width;
  double? _height;
  Widget? _child;

  SizedBoxBuilder withSize({
    double? width,
    double? height,
  }) {
    _width = width;
    _height = height;
    return this;
  }

  SizedBox withChild(Widget child) {
    _child = child;
    return SizedBox(
      width: _width?.w,
      height: _height?.h,
      child: _child,
    );
  }

  SizedBox build() {
    return SizedBox(
      width: _width?.w,
      height: _height?.h,
      child: _child,
    );
  }
}
