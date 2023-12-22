import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:letterboxd/data/app_data.dart';

class PopularThisMonthWidget extends StatelessWidget {
  const PopularThisMonthWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var colors = [
      Colors.teal,
      Colors.red,
      Colors.yellow,
      Colors.pink,
      Colors.amber
    ];
    final title = GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFFE9A6A6),
        fontSize: 19,
      ),
    );
    return SizedBox(
      height: height * .4, //3
      child: LayoutBuilder(builder: (context, size) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return LayoutBuilder(builder: (context, mainS) {
              return Container(
                height: mainS.maxHeight, //3
                width: width * .5,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.white),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // child: TestingCard(index, colors),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: LayoutBuilder(
                        builder: (context, size) {
                          return StackImage(
                              images: AppData.popularThisMonth[index].images,
                              size: size);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppData.popularThisMonth[index].title,
                            style: title,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                // const Spacer(),
                                Expanded(
                                  child: Row(
                                    children: [
                                      // const SizedBox(width: 8),
                                      CircleAvatar(
                                        radius: 14,
                                        backgroundImage: AssetImage(
                                          AppData
                                              .popularThisMonth[index].avatar,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        AppData
                                            .popularThisMonth[index].userName,
                                        style: const TextStyle(
                                          color: Color(0xFFE9A6A6),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.red,
                                      ),
                                      Text(AppData.popularThisMonth[index].loved
                                          .toString()),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        CupertinoIcons.mail,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(AppData
                                          .popularThisMonth[index].comments
                                          .toString()),
                                      // const SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
          },
          itemCount: AppData.popularThisMonth.length,
        );
      }),
    );
  }
}

class StackImage extends StatefulWidget {
  final List<String> images;
  final BoxConstraints size;
  const StackImage({
    Key? key,
    required this.images,
    required this.size,
  }) : super(key: key);

  @override
  State<StackImage> createState() => _StackImageState();
}

class _StackImageState extends State<StackImage> {
  List<Color> colors = [
    Colors.teal,
    Colors.red,
    Colors.yellow,
    Colors.brown,
    Colors.purpleAccent
  ];

  late List<double> opacity;
  late List<double> positions;
  late List<String> images;

  @override
  void initState() {
    super.initState();
    images = [...widget.images];
    opacity = List.generate(images.length, (index) => .2);
    positions = List.generate(
        images.length, (index) => (widget.size.maxWidth / 2) * (index / 3));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < images.length; i++)
          AnimatedPositioned(
            height: widget.size.maxHeight,
            width: widget.size.maxWidth * .5,
            right: positions[i],
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: MouseRegion(
              onHover: (event) {
                print.call('Hovering');
                String zeroIndex = images[images.length - 1];
                images[images.length - 1] = images[i];
                images[i] = zeroIndex;
                colors.shuffle();
                opacity = List.generate(
                    images.length, (index) => index == 3 ? 1.0 : 1);
                setState(() {});
              },
              onExit: (event) {
                print.call("Exit");
                setState(() {
                  opacity[i] = .2;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceInOut,
                height: widget.size.maxHeight,
                width: widget.size.maxWidth * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors[i].withOpacity(opacity[i]),
                ),
                child: Card(
                  elevation: 19,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      images[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
