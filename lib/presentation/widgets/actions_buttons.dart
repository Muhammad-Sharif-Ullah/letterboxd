import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/presentation/pages/write_review.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.heroTag,
  }) : super(key: key);
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double space = 14;
    final height = MediaQuery.of(context).size.height;
    final btnStyle = GoogleFonts.openSans(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    );

    List<Map<String, String>> rateButtons = [
      {"Rate or Review": AppAssets.rateOrReview},
      {"Add to Lists     ": AppAssets.addToLists},
      {"Add to Watch List": AppAssets.addToWatchList},
    ];
    return Expanded(
      child: Container(
        // color: Colors.white12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < rateButtons.length; i++)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: width,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        print.call(i);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WriteReview(heroTag: heroTag),
                          ),
                        );
                      },
                      fillColor: const Color(0xFFE9A6A6),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: space),
                            Image.asset(
                              rateButtons[i].entries.first.value,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: space),
                            Text(rateButtons[i].entries.first.key,
                                style: btnStyle),
                            SizedBox(width: space),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}



// const Color(0xFFE9A6A6)

//  style: GoogleFonts.openSans(
//                           textStyle: const TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),