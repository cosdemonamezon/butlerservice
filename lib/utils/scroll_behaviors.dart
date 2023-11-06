import 'package:flutter/material.dart';

class ScrollBuilder {
	static Widget Function(BuildContext, Widget?) scrollBuilder = (context, child) {
    return ScrollConfiguration(
      behavior: ScrollBehaviors(),
      child: child!,
    );
  };
}

class ScrollBehaviors extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
