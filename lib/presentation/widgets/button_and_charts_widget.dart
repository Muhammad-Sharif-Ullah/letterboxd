import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:letterboxd/presentation/widgets/actions_buttons.dart';
import 'package:letterboxd/presentation/widgets/graph_and_text_widget.dart';

class ButtonAndChartsWidget extends StatelessWidget {
  const ButtonAndChartsWidget({
    Key? key,
    required this.heroTag,
  }) : super(key: key);

  final String heroTag;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            ActionButtons(heroTag: heroTag),
            const SizedBox(width: 10),
            GraphAndTextWidget(width: width),
          ],
        ),
      ),
    );
  }
}
