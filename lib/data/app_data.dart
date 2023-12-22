import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/model/movie_review_model.dart';
import 'package:letterboxd/model/popular_this_month.dart';
import 'package:letterboxd/model/recent_view_model.dart';

class AppData {
  static List<RecentViewModel> friendsReview = [
    RecentViewModel(
      avatar: AppAssets.reviewAvatars[0],
      rate: 4,
      message: 8,
      movieName: "The Irishman",
      movieImage: AppAssets.reviewMovies[0],
      reviewBy: "Adrian",
      reviewText:
          "not sure i've ever mentioned this before but i have a very personal fear of not... feeling... correctly. like enormously important things are happening around you in a matter-of-fact, dissociative way that you can understand the significance of but you can't shake..",
      year: 2019,
    ),
    RecentViewModel(
      rate: 4,
      message: 2,
      avatar: AppAssets.reviewAvatars[1],
      movieName: "Zack Snyder’s Justice League",
      movieImage: AppAssets.reviewMovies[1],
      reviewBy: "Audrey",
      reviewText:
          "the interesting thing about snyder is that he always swings big: whether it results in a colossal whiff or a home run just depends on the particular project, amount of creative control, and audience reception. but he always puts his unique style into it, and for that reason i’ve really grown fond of his stuff. his involvement in the dceu has kept me interested, and i still have fun with both their best content or biggest flops...",
      year: 2019,
    ),
    RecentViewModel(
      rate: 4,
      message: 22,
      avatar: AppAssets.reviewAvatars[2],
      movieName: "tick, tick…BOOM!",
      movieImage: AppAssets.reviewMovies[2],
      reviewBy: "Rebecca",
      reviewText:
          "not sure i've ever mentioned this before but i have a very personal fear of not... feeling... correctly. like enormously important things are happening around you in a matter-of-fact, dissociative way that you can understand the significance of but you can't shake..",
      year: 2019,
    ),
    RecentViewModel(
      avatar: AppAssets.reviewAvatars[0],
      rate: 4,
      message: 8,
      movieName: "The Irishman",
      movieImage: AppAssets.reviewMovies[0],
      reviewBy: "Adrian",
      reviewText:
          "not sure i've ever mentioned this before but i have a very personal fear of not... feeling... correctly. like enormously important things are happening around you in a matter-of-fact, dissociative way that you can understand the significance of but you can't shake..",
      year: 2019,
    ),
    RecentViewModel(
      rate: 4,
      message: 2,
      avatar: AppAssets.reviewAvatars[1],
      movieName: "Zack Snyder’s Justice League",
      movieImage: AppAssets.reviewMovies[1],
      reviewBy: "Audrey",
      reviewText:
          "the interesting thing about snyder is that he always swings big: whether it results in a colossal whiff or a home run just depends on the particular project, amount of creative control, and audience reception. but he always puts his unique style into it, and for that reason i’ve really grown fond of his stuff. his involvement in the dceu has kept me interested, and i still have fun with both their best content or biggest flops...",
      year: 2019,
    ),
    RecentViewModel(
      rate: 4,
      message: 22,
      avatar: AppAssets.reviewAvatars[2],
      movieName: "tick, tick…BOOM!",
      movieImage: AppAssets.reviewMovies[2],
      reviewBy: "Rebecca",
      reviewText:
          "not sure i've ever mentioned this before but i have a very personal fear of not... feeling... correctly. like enormously important things are happening around you in a matter-of-fact, dissociative way that you can understand the significance of but you can't shake..",
      year: 2019,
    )
  ];

  static List<String> favoriteViews = [
    AppAssets.fv1,
    AppAssets.fv2,
    AppAssets.fv3,
    AppAssets.fv4,
  ];
  static List<String> recentWatch = [
    AppAssets.rw1,
    AppAssets.rw2,
    AppAssets.rw3,
    AppAssets.rw4,
  ];

  static const casts = [
    AppAssets.cast1,
    AppAssets.cast2,
    AppAssets.cast3,
    AppAssets.cast4,
  ];

  static final List<MovieReviewModel> movieReviews = [
    MovieReviewModel(
      avatar: AppAssets.reviewAvatars[0],
      reviewBy: "David",
      rate: 4,
      message: 5,
      review:
          "It was less than three years ago that Todd Phillips’ mid-budget but mega-successful “Joker” threateningly pointed toward a future in which superhero movies of all sizes would become so endemic to modern cinema that they no longer had to be superhero movies at all. With Matt Reeves’ “The Batman” — a sprawling, 176-minute latex procedural that often appears to have more in common with serial killer sagas like “Se7en” and “Zodiac” than it does anything in the Snyderverse or the MCU — that future has arrived with shuddering force, for better or worse. Mostly better. ",
    ),
    MovieReviewModel(
        avatar: AppAssets.reviewAvatars[1],
        reviewBy: "Mason",
        rate: 5,
        message: 15,
        review:
            "Believe the hype.\n\nThe Batman is a gritty noir detective story, which immediately sets it apart from the previous iterations and the aspect that I loved the most. The grime and desolation of Gotham oozes out of each scene through its immaculate cinematography and injected into your veins through Giacchino's brilliant score..."),
    MovieReviewModel(
      avatar: AppAssets.reviewAvatars[2],
      reviewBy: "David",
      rate: 4,
      message: 10,
      review:
          "It was less than three years ago that Todd Phillips’ mid-budget but mega-successful “Joker” threateningly pointed toward a future in which superhero movies of all sizes would become so endemic to modern cinema that they no longer had to be superhero movies at all. With Matt Reeves’ “The Batman” — a sprawling, 176-minute latex procedural that often appears to have more in common with serial killer sagas like “Se7en” and “Zodiac” than it does anything in the Snyderverse or the MCU — that future has arrived with shuddering force, for better or worse. Mostly better. ",
    ),
  ];

  static final List<PopularThisMonth> popularThisMonth = [
    PopularThisMonth(
      images: AppAssets.lifeChanging,
      title: "Life-Changing Movies",
      avatar: AppAssets.reviewAvatars[0],
      loved: 4,
      comments: 79,
      userName: "Alejandro",
    ),
    PopularThisMonth(
      images: AppAssets.thriller,
      title: "100 Best Thriller Movies",
      avatar: AppAssets.reviewAvatars[1],
      loved: 887,
      comments: 123,
      userName: "Wendy",
    ),
    PopularThisMonth(
      images: AppAssets.comfort,
      title: "Comfort Movies To Watch",
      avatar: AppAssets.reviewAvatars[2],
      loved: 552,
      comments: 37,
      userName: "Ruth",
    ),
  ];
  AppData._();
}
