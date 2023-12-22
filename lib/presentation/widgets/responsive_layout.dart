import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.maxWidth,
    required this.landScape,
    required this.portrait,
  }) : super(key: key);

  final double maxWidth;
  final Widget landScape;
  final Widget portrait;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      if (size.maxWidth >= maxWidth) {
        return landScape;
      }
      return portrait;
    });
  }
}
