import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

extension ScreenUtilGap on Gap {
  Gap setHeight() {
    return Gap(mainAxisExtent.h);
  }

  Gap setWidth() {
    return Gap(mainAxisExtent.w);
  }
}
