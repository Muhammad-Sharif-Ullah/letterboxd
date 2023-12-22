import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        // color: Colors.white10,
        child: LayoutBuilder(
          builder: (context, sized) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xFFEC2626),
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    SizedBox(
                      height: (13 * (5 + 1)).toDouble(),
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                            height: 3,
                            width: width * .1,
                            color: const Color(0xFF8F8E9B),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 3),
                    ...List.generate(
                      5,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: index % 2 == 0 ? 0 : 3),
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 1000),
                            tween: Tween<double>(
                                begin: 0, end: (13 * (index + 1)).toDouble()),
                            builder: (context, value, child) {
                              return Container(
                                width: 8,
                                height: value,
                                color: const Color(0xFF8F8E9B),
                              );
                            },
                          )
                          // child: Container(
                          //   width: 8,
                          //   height: (13 * (index + 1)).toDouble(),
                          //   color: const Color(0xFF8F8E9B),
                          // ),
                          ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
