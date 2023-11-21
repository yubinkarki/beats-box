import 'package:flutter/material.dart';

import 'package:beats_box/constants/constants_barrel.dart' show AppColors;
import 'package:beats_box/globals/loading_overlay_controller.dart' show LoadingOverlayController;

class LoadingOverlay {
  LoadingOverlayController? controller;

  void hide() {
    controller?.close();
    controller = null;
  }

  void show(BuildContext context) {
    controller = showOverlay(context);
  }

  LoadingOverlayController showOverlay(BuildContext context) {
    final OverlayState state = Overlay.of(context);

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: AppColors.translucentBlackSpinner,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(color: AppColors.transparent),
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return LoadingOverlayController(
      close: () {
        overlay.remove();

        return true;
      },
      update: (text) => true,
    );
  }
}
