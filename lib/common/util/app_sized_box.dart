import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedBoxBuilder {
  double? _width;
  double? _height;
  Widget? _child;

  SizedBoxBuilder setWidth(double width) {
    _width = width;
    return this;
  }

  SizedBoxBuilder setHeigh(double height) {
    _height = height;
    return this;
  }

  SizedBox setChild(Widget child, {bool useScreenUitl = true}) {
    _child = child;

    if (useScreenUitl) {
      return SizedBox(
        width: _width?.w,
        height: _height?.h,
        child: _child,
      );
    }

    return SizedBox(
      width: _width,
      height: _height,
      child: _child,
    );
  }

  SizedBox build({bool useScreenUitl = true}) {
    if (useScreenUitl) {
      return SizedBox(
        width: _width?.w,
        height: _height?.h,
        child: _child,
      );
    }

    return SizedBox(
      width: _width,
      height: _height,
      child: _child,
    );
  }
}
