import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/constants/app_textStyle.dart';
import 'package:letterboxd/presentation/widgets/button_and_charts_widget.dart';
import 'package:letterboxd/presentation/widgets/cast_crews_details.dart';
import 'package:letterboxd/presentation/widgets/movei_reviews.dart';

import 'package:letterboxd/presentation/widgets/movie_header_widget.dart';
import 'package:letterboxd/presentation/widgets/ratings_title_widget.dart';

class MoviePage extends StatefulWidget {
  final String index;
  const MoviePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isLandScape = width > 400 ? true : false;
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MovieHeaderWidget(width: width, widget: widget),
              const SizedBox(height: 10),
              const RatingsTitleWidget(),
              const SizedBox(height: 10),
              ButtonAndChartsWidget(heroTag: widget.index),
              const SizedBox(height: 10),
              const CastCrewsDetails(),
              const SizedBox(height: 28),
              const MovieReviews(),
            ],
          ),
        ),
      ),
    );
  }
}
