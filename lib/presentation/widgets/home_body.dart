import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/constants/app_textStyle.dart';
import 'package:letterboxd/data/app_data.dart';
import 'package:letterboxd/presentation/widgets/popular_this_month_widget.dart';
import 'package:letterboxd/presentation/widgets/review_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 3600),
      curve: Curves.ease,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Hello, ",
                        children: [
                          TextSpan(
                            text: "Kyran!, ",
                            style: AppStyle.hello
                                .copyWith(color: const Color(0xFFE9A6A6)),
                          ),
                        ],
                      ),
                      style: AppStyle.hello,
                    ),
                    Text(
                      "Review or track film you’ve watched...",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Popular Films This Month",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Image.asset(AppAssets.thisMoth[index]),
                        separatorBuilder: (context, index) => SizedBox(),
                        itemCount: AppAssets.thisMoth.length,
                      ),
                    ),
                    const SizedBox(height: 27),
                    Text(
                      "Popular Lists This Month",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 18),
                    PopularThisMonthWidget(height: height, width: width),
                    const SizedBox(height: 50),
                    Text(
                      "Recent Friends’ Review",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 18),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final review = AppData.friendsReview[index];
                        return RecentViewCard(review: review);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: AppData.friendsReview.length,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
