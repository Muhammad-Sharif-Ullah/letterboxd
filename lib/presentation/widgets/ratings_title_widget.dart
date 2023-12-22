import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letterboxd/presentation/widgets/view_counting_widget.dart';

class RatingsTitleWidget extends StatelessWidget {
  const RatingsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 9,
                  color: Color(0xFF8F8E9B),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ViewCountingWidget(
                    icon: Icons.visibility,
                    text: "40k",
                    color: Colors.greenAccent,
                  ),
                  ViewCountingWidget(
                    icon: Icons.favorite,
                    text: "30k",
                    color: Colors.red,
                  ),
                  ViewCountingWidget(
                    icon: Icons.list,
                    text: "12k",
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              'Ratings',
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF8F8E9B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
