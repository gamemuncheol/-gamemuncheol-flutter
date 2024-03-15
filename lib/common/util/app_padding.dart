import 'package:flutter/material.dart';

class PaddingBuilder {
  EdgeInsets? _padding;
  late final Widget _child;

  PaddingBuilder withPadding({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    _padding = EdgeInsets.only(
      left: left ?? 0,
      right: right ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0,
    );

    return this;
  }

  Padding withChild(Widget child) {
    _child = child;

    return Padding(
      padding: _padding ?? const EdgeInsets.all(0),
      child: _child,
    );
  }
}
