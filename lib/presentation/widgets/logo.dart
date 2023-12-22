import 'package:flutter/material.dart';
import 'package:letterboxd/constants/app_assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.dots),
        const SizedBox(height: 10),
        Image.asset(AppAssets.letterboxd),
      ],
    );
  }
}
