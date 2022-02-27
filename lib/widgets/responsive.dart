import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {Key? key, required this.mobile, required this.desktop, this.tablet})
      : super(key: key);

  final Widget mobile;

  final Widget desktop;
  final Widget? tablet;

  static bool isMobile(context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTablet(context) {
    return MediaQuery.of(context).size.width < 1200 &&
        MediaQuery.of(context).size.width >= 800;
  }

  static bool isDesktop(context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if ( constraints.maxWidth >= 1200){
        return desktop;
      } else if (constraints.maxWidth >= 800){
        return tablet ?? mobile ;
      } else return mobile ;
    });
  }
}
