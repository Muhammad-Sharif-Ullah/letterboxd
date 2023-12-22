import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/constants/app_textStyle.dart';
import 'package:letterboxd/data/app_data.dart';
import 'package:letterboxd/presentation/pages/movie_page.dart';
import 'package:letterboxd/presentation/widgets/review_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isLandScape = width > 400 ? true : false;
    return Scaffold(
        body: TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1600),
      curve: Curves.ease,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              // height: height,
              // width: width,
              child: Column(
                children: [
                  ProfileHeader(width: width),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileStatistics(),
                      FavoriteFilmsListView(width: width),
                      RecentWatchListView(width: width),
                      const UserRecentReviews(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));

    //   body: SingleChildScrollView(
    //     physics: const BouncingScrollPhysics(),
    //     child: SizedBox(
    //       // height: height,
    //       // width: width,
    //       child: Column(
    //         children: [
    //           ProfileHeader(width: width),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const ProfileStatistics(),
    //               FavoriteFilmsListView(width: width),
    //               RecentWatchListView(width: width),
    //               const UserRecentReviews(),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),

    // );
  }
}

class UserRecentReviews extends StatelessWidget {
  const UserRecentReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kyran’s Recent Reviewed",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: const Color(0xFFE9A6A6),
                ),
                child: const Text('Sell All'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final review = AppData.friendsReview[index];
              return RecentViewCard(review: review);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: AppData.friendsReview.length,
          ),
        ),
      ],
    );
  }
}

class RecentWatchListView extends StatelessWidget {
  const RecentWatchListView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Kyran’s Recent Watched",
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: width * .45,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviePage(
                                index: index.toString(),
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Hero(
                          tag: index.toString(),
                          child: Image.asset(
                            AppData.recentWatch[index],
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          4,
                          (index) => const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.red,
                            size: 12,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Read Review",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9C4A8B),
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            size: 14,
                            color: Color(0xFF9C4A8B),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: AppData.recentWatch.length,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteFilmsListView extends StatelessWidget {
  const FavoriteFilmsListView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Kyran’s Favorite Films",
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: width * .3,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // TODO: Removed FittedBox
                return Image.asset(
                  AppData.favoriteViews[index],
                  // fit: BoxFit.cover,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: AppData.favoriteViews.length,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          StatisticsColumn(
            number: 455,
            title: "Total Films",
            numberColor: Color(0xFFE9A6A6),
          ),
          StatisticsColumn(
            number: 33,
            title: "Film This Year",
            numberColor: Color(0xFF9C4A8B),
          ),
          StatisticsColumn(
            number: 4,
            title: "Lists",
            numberColor: Color(0xFFE9A6A6),
          ),
          StatisticsColumn(
            number: 30,
            title: "Review",
            numberColor: Color(0xFF9C4A8B),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: width,
      child: Stack(
        children: [
          SizedBox(
            height: 160,
            width: width,
            child: Image.asset(
              AppAssets.profileBanner,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 80,
              width: 80,
              child: FittedBox(
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.avatar),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: (width / 2) - 160),
                    Text(
                      'Kyran',
                      style: AppStyle.profileName,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 25,
                      child: FittedBox(
                        child: Chip(
                          label: const Text("Pro"),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text('500 Followers'),
                        const SizedBox(height: 4),
                        Container(
                          height: 3,
                          width: 80,
                          color: const Color(0xFFE9A6A6),
                        )
                      ],
                    ),
                    const SizedBox(width: 25),
                    Column(
                      children: [
                        const Text('420 Followings'),
                        const SizedBox(height: 4),
                        Container(
                          height: 3,
                          width: 80,
                          color: const Color(0xFFE9A6A6),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatisticsColumn extends StatelessWidget {
  const StatisticsColumn(
      {Key? key,
      required this.number,
      required this.title,
      required this.numberColor})
      : super(key: key);

  final int number;
  final String title;
  final Color numberColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1800),
          tween: Tween<double>(begin: 0, end: number.toDouble()),
          builder: (context, value, child) {
            return Text(
              value.toStringAsFixed(0),
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: numberColor, //Color(0xFFE9A6A6)
                ),
              ),
            );
          },
        ),
        Text(
          title,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontSize: 12,
              //Color(0xFFE9A6A6)
            ),
          ),
        ),
      ],
    );
  }
}
