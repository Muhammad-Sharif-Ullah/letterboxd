import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letterboxd/data/app_data.dart';
import 'package:letterboxd/model/movie_review_model.dart';
import 'package:letterboxd/presentation/widgets/movie_review_card.dart';

class MovieReviews extends StatelessWidget {
  const MovieReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleStyle = GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );
    final textBTN = TextButton.styleFrom(
      primary: const Color(0xFFE9A6A6),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Reviews",
                style: titleStyle,
              ),
              TextButton(
                onPressed: () {},
                style: textBTN,
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFF8F8E9B),
          thickness: 1.2,
        ),
        // const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final MovieReviewModel review = AppData.movieReviews[index];
              return MovieReviewCard(review: review);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: AppData.movieReviews.length,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
