import 'package:flutter/material.dart';

extension PreferredSizedWidget on Widget {
  PreferredSize toAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: this,
    );
  }
}
