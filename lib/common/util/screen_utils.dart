import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilPadding on EdgeInsets {
  // 패딩에 스크린유틸 적용
  EdgeInsets su() {
    return copyWith(
      left: left.w,
      right: right.w,
      top: top.h,
      bottom: bottom.h,
    );
  }
}

extension ScreenUtilContainer on Container {
  // 컨테이너에 스크린유틸 적용
  Container su({
    double? width,
    double? height,
  }) {
    return Container(
      margin: margin,
      padding: padding,
      width: width?.w,
      height: height?.h,
      decoration: decoration,
      child: child,
    );
  }
}

extension ScreenUtilSizedBox on SizedBox {
  // 사이즈드박스에 스크린유틸 적용
  SizedBox su() {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: child,
    );
  }
}
