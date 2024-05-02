import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerBuilder {
  double? _width;
  double? _height;
  EdgeInsets? _padding;
  EdgeInsets? _margin;
  BoxDecoration? _boxDecoration;
  Widget? _child;

  ContainerBuilder withPadding({
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

  ContainerBuilder withMargin({
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) {
    _margin = EdgeInsets.only(
      left: left ?? (horizontal == null ? 0 : horizontal / 2),
      right: right ?? (horizontal == null ? 0 : horizontal / 2),
      top: top ?? (vertical == null ? 0 : vertical / 2),
      bottom: bottom ?? (vertical == null ? 0 : vertical / 2),
    );

    return this;
  }

  ContainerBuilder setWidth(double width) {
    _width = width;
    return this;
  }

  ContainerBuilder setHeigh(double height) {
    _height = height;
    return this;
  }

  ContainerBuilder withSize({
    double? width,
    double? height,
  }) {
    _width = width;
    _height = height;
    return this;
  }

  ContainerBuilder setBoxDecoration(BoxDecoration boxDecoration) {
    _boxDecoration = boxDecoration;
    return this;
  }

  Container setChild(Widget child) {
    _child = child;
    return Container(
      padding: _padding?.copyWith(
        left: _padding?.left.w,
        right: _padding?.right.w,
        top: _padding?.top.h,
        bottom: _padding?.bottom.h,
      ),
      margin: _margin?.copyWith(
        left: _margin?.left.w,
        right: _margin?.right.w,
        top: _margin?.top.h,
        bottom: _margin?.bottom.h,
      ),
      width: _width?.w,
      height: _height?.h,
      decoration: _boxDecoration,
      child: _child,
    );
  }

  Container build() {
    return Container(
      padding: _padding?.copyWith(
        left: _padding?.left.w,
        right: _padding?.right.w,
        top: _padding?.top.h,
        bottom: _padding?.bottom.h,
      ),
      margin: _margin?.copyWith(
        left: _margin?.left.w,
        right: _margin?.right.w,
        top: _margin?.top.h,
        bottom: _margin?.bottom.h,
      ),
      width: _width?.w,
      height: _height?.h,
      decoration: _boxDecoration,
      child: _child,
    );
  }
}
