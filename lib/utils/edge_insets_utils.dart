import 'package:flutter/material.dart';

EdgeInsets all(double value) {
  return EdgeInsets.all(value);
}

EdgeInsets symmetric({double? vertical, double? horizontal}) {
  return EdgeInsets.symmetric(vertical: vertical ?? 0.0, horizontal: horizontal ?? 0.0);
}

EdgeInsets only({double? left, double? top, double? right, double? bottom}) {
  return EdgeInsets.only(
    left: left ?? 0.0,
    top: top ?? 0.0,
    right: right ?? 0.0,
    bottom: bottom ?? 0.0,
  );
}

EdgeInsets from({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) {
  return EdgeInsets.fromLTRB(left, top, right, bottom);
}
