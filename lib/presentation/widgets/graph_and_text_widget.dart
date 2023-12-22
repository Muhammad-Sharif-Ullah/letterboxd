import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letterboxd/presentation/widgets/graph_widget.dart';
import 'package:letterboxd/presentation/widgets/rating_and_stars.dart';

class GraphAndTextWidget extends StatelessWidget {
  const GraphAndTextWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          GraphWidget(width: width),
          const SizedBox(width: 10),
          const RatingAndStars(),
        ],
      ),
    );
  }
}
