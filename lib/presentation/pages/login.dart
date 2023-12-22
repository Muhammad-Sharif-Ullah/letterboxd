import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/constants/app_textStyle.dart';
import 'package:letterboxd/presentation/pages/home.dart';
import 'package:letterboxd/presentation/pages/signup.dart';
import 'package:letterboxd/presentation/pages/splash_page.dart';
import 'package:letterboxd/presentation/widgets/responsive_layout.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double topBannerHeight = height >= 400 ? 400 : 350;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1D37),
      body: ResponsiveLayout(
          maxWidth: 400,
          landScape: SingleChildScrollView(
            child: Column(
              children: [
                _headerSection(width, topBannerHeight),
                SizedBox(
                  height: 400,
                  child: _bottomSection(context, width),
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
                  _headerSection(width, topBannerHeight),
                  // const SizedBox(height: 64),
                  Expanded(
                    child: _bottomSection(context, width),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _headerSection(double width, double topBannerHeight) {
    return SizedBox(
      height: topBannerHeight,
      width: width,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.banner,
            width: width,
            height: topBannerHeight,
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
            height: topBannerHeight,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: TweenAnimationBuilder<double>(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 4000),
              tween: Tween<double>(begin: 0.0, end: 1.0),
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

  _bottomSection(BuildContext context, double width) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, chid) {
        return Opacity(
          opacity: value,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 17),
              Text(
                'Login',
                style: AppStyle.loginTitle,
              ),
              Text(
                "Please sign in to continue.",
                style: AppStyle.loginSubtitle,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: width * .75,
                height: 50,
                child: TextField(
                  cursorColor: Color(0xFFFACABB4),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: const Color(0xFF595768),
                    prefixIcon: const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Color(0xFFACABB4),
                    ),
                    hintText: "User Name",
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: width * .75,
                height: 50,
                child: TextField(
                  cursorColor: const Color(0xFFFACABB4),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: const Color(0xFF595768),
                    prefixIcon: const Icon(
                      CupertinoIcons.lock,
                      color: Color(0xFFACABB4),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              SizedBox(
                width: width * .75,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xFFE9A6A5),
                    ),
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashScreen()),
                    );
                  },
                  style: AppStyle.elevatedBTN,
                  child: Text(
                    'Login',
                    style: AppStyle.elevatedText,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account? Please',
                      style: AppStyle.mixText.copyWith(fontSize: 12)),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xFF9D498B),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text("Sign Up"),
                  ),
                  Text(
                    'Now',
                    style: AppStyle.mixText.copyWith(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
