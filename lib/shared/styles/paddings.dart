import 'package:flutter/cupertino.dart';

class YuktPaddings {
  static yuktAuthPadding({l, r, t, b, child}) {
    return Padding(
      padding: EdgeInsets.only(
        left: l ?? 30,
        right: r ?? 30,
        top: t ?? 100,
        bottom: b ?? 50,
      ),
      child: child,
    );
  }
}
