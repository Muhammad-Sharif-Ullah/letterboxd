import 'package:flutter/material.dart';
import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/presentation/pages/movie_page.dart';
import 'package:letterboxd/presentation/widgets/clip_shadow_path.dart';
import 'package:letterboxd/presentation/widgets/image_cliper.dart';
import 'package:letterboxd/presentation/widgets/movie_info_widget.dart';

class MovieHeaderWidget extends StatelessWidget {
  const MovieHeaderWidget({
    Key? key,
    required this.width,
    required this.widget,
  }) : super(key: key);

  final double width;
  final MoviePage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          SizedBox(
            // height: 250,
            width: width,
            child: ClipShadowPath(
              shadow: const BoxShadow(
                color: Colors.black38,
                offset: Offset(5, 4),
                blurRadius: 10,
                spreadRadius: 20,
              ),
              child: Image.asset(
                AppAssets.poster,
                fit: BoxFit.fill,
              ),
              clipper: ImageClipper(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: width, // * .8,
              // color: Colors.black,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MovieInfoWidget(index: widget.index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
