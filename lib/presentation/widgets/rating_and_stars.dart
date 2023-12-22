import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingAndStars extends StatelessWidget {
  const RatingAndStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '4.4',
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                // fontWeight: FontWeight.bold,
                color: Color(0xFFE9A6A6),
                fontSize: 30,
              ),
            ),
          ),
          FittedBox(
            child: Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  CupertinoIcons.star_fill,
                  color: Color(0xFFEC2626),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
