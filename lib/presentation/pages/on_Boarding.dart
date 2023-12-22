import 'package:flutter/material.dart';

import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/constants/app_text.dart';
import 'package:letterboxd/constants/app_textStyle.dart';
import 'package:letterboxd/presentation/pages/login.dart';
import 'package:letterboxd/presentation/widgets/responsive_layout.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isCompleteTextAnimation = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print.call(width);
    return Scaffold(
      backgroundColor: const Color(0xFF1E1D37),
      body: ResponsiveLayout(
        maxWidth: 375,
        landScape: SingleChildScrollView(
          child: Column(
            children: [
              _headerSection(width),
              SizedBox(
                height: 300,
                child: _bottomSection(context),
              ),
            ],
          ),
        ),
        portrait: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                _headerSection(width),
                // const SizedBox(height: 64),
                Expanded(
                  child: _bottomSection(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _headerSection(double width) {
    return SizedBox(
      height: 447,
      width: width,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.onBoarding,
            width: width,
            height: 447,
            fit: BoxFit.fill,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFF1F1D36).withOpacity(0.4),
                  const Color(0xFF1F1D36).withOpacity(0.4),
                ],
              ),
            ),
            height: 447,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: TweenAnimationBuilder<double>(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 4000),
              tween: Tween<double>(
                  begin: isCompleteTextAnimation ? 0.0 : 1.0, end: 1.0),
              builder: (context, opacity, child) {
                return Opacity(
                  opacity: opacity,
                  child: Column(
                    children: [
                      Image.asset(AppAssets.dots),
                      const SizedBox(height: 10),
                      Image.asset(AppAssets.letterboxd),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSection(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 4000),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      onEnd: () {
        setState(() {
          isCompleteTextAnimation = true;
        });
      },
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Text(
                  AppText.onBoardingText,
                  style: AppStyle.onBoardingText,
                ),
              ),
              SizedBox(
                height: 45,
                child: Hero(
                  tag: "Start Hero",
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: AppStyle.elevatedBTN,
                    child: Text(
                      'Get Started',
                      style: AppStyle.elevatedText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
