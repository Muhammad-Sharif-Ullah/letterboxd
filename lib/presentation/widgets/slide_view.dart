import 'dart:math';

import 'package:flutter/material.dart';

import 'package:letterboxd/constants/app_assets.dart';

class MyCustomWidget extends StatefulWidget {
  final double width;
  final List<String> movies;
  const MyCustomWidget({
    Key? key,
    required this.width,
    required this.movies,
  }) : super(key: key);
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  late double _page;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    _page = widget.movies.length.toDouble();
    pageController = PageController(initialPage: 0);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!.toDouble();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: widget.width,
              width: widget.width * .95,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = [];

                  for (int i = 0; i < widget.movies.length; i++) {
                    double currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > 0;

                    double start = 20 +
                        max(
                            (boxConstraints.maxWidth - widget.width * .75) -
                                ((boxConstraints.maxWidth -
                                            widget.width * .75) /
                                        2) *
                                    -currentPageValue *
                                    (pageLocation ? 9 : 1),
                            0.0);
                    Positioned customizableCard = Positioned.directional(
                      // top: 20 + 30 * max(-currentPageValue, 0.0),
                      // bottom: 20 + 30 * max(-currentPageValue, 0.0),
                      start: start,
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        height: widget.width,
                        width: widget.width * .67,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.movies[i],
                            // height: widget.width,
                            // width: widget.width * .67,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: widget.movies.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
