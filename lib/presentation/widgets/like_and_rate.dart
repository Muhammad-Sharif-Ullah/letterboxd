import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:letterboxd/constants/app_assets.dart';

class LikeAndRate extends StatefulWidget {
  const LikeAndRate({
    Key? key,
    required this.heroTag,
  }) : super(key: key);
  final String heroTag;

  @override
  State<LikeAndRate> createState() => _LikeAndRateState();
}

class _LikeAndRateState extends State<LikeAndRate> {
  double rate = 0;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
    final subTitle = GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontSize: 13,
      ),
    );
    final caption = GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontSize: 11,
      ),
    );

    return SizedBox(
      height: 206,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: "The Batman",
                    style: title,
                    children: [
                      TextSpan(
                        text: "\t\t\t2022",
                        style: subTitle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text("Specify the date you watched it", style: caption),
                RawMaterialButton(
                  fillColor: const Color(0xFF3D3B54),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FittedBox(
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset(
                          AppAssets.diary,
                          height: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text("06 March 2022"),
                        const SizedBox(width: 10),
                        const Text(
                          "Change",
                          style: TextStyle(color: Color(0xFFE9A6A6)),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text("Giving Your Rating", style: caption),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RatingBar(
                      initialRating: rate,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      ratingWidget: RatingWidget(
                        full: const Icon(CupertinoIcons.star_fill,
                            color: Color(0xFFEC2626)),
                        half: const Icon(CupertinoIcons.star_lefthalf_fill,
                            color: Color(0xFFEC2626)),
                        empty: const Icon(
                          CupertinoIcons.star_fill,
                          color: Color(0xFF3D3B54),
                        ),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        setState(() {
                          rate = rating;
                        });
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        color: isLiked
                            ? const Color(0xFFEC2626)
                            : const Color(0xFF3D3B54),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Hero(
            tag: widget.heroTag,
            child: SizedBox(
              height: 166,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(AppAssets.rw4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
