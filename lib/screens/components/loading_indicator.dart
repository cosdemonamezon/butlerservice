import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';

class LoadingIndicator {
  static OverlayEntry? overlayEntry;

  static void open(BuildContext context) {
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: kBlack.withOpacity(0.3),
              ),
            ),
            const Center(child: CircularProgressIndicator(color: kBackgroundColor, strokeWidth: 5))
          ],
        ),
      );
      Overlay.of(context).insert(overlayEntry!);
    }
  }

  static void close() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
