import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

extension ScreenUtilGap on Gap {
  Gap withHeight() {
    return Gap(mainAxisExtent.h);
  }

  Gap withWidth() {
    return Gap(mainAxisExtent.w);
  }
}
