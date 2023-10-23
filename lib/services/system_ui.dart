import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, Brightness;
import "package:flutter/services.dart" show SystemChrome, SystemUiMode, DeviceOrientation, SystemUiOverlayStyle;

import 'package:beats_box/constants/app_colors.dart' show AppColors;

void androidSystemUI() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  if (defaultTargetPlatform == TargetPlatform.android) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.transparent,
      ),
    );
  }
}
