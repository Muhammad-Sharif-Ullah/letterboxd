import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letterboxd/model/recent_view_model.dart';
import 'package:letterboxd/presentation/widgets/read_more.dart';

class RecentViewCard extends StatelessWidget {
  const RecentViewCard({
    Key? key,
    required this.review,
  }) : super(key: key);
  final RecentViewModel review;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(10, 233, 166, 166),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
          bottomLeft: Radius.circular(7),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(review.avatar),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                SizedBox(
                  height: 20,
                  child: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        text: review.movieName,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: " ${review.year}",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF94929E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 20,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Review by ",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF94929E),
                              ),
                            ),
                            children: [
                              TextSpan(
                                text: review.reviewBy,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFE9A6A6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        ...List.generate(
                          review.rate,
                          (int index) => const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.red,
                            size: 12,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          CupertinoIcons.mail,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${review.message}',
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF94929E),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ReadMoreText(
                  review.reviewText,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Show less',
                  style: const TextStyle(fontSize: 12),
                  moreStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C4A8B),
                  ),
                  lessStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C4A8B),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(review.movieImage),
            ),
          ),
        ],
      ),
    );
  }
}
