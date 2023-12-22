import 'package:flutter/material.dart';

import 'package:letterboxd/constants/app_textStyle.dart';
import 'package:letterboxd/presentation/widgets/like_and_rate.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({
    Key? key,
    required this.heroTag,
  }) : super(key: key);
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Your Review'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LikeAndRate(heroTag: heroTag),
                  TextField(
                    cursorColor: const Color(0xfffacabb4),
                    maxLines: (height * .2) ~/ 10,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF595768),
                      hintText: "Write down your review...",
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: AppStyle.elevatedBTN,
                      child: const Text(
                        'Publish',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
