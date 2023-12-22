import 'package:flutter/material.dart';
import 'package:letterboxd/data/app_data.dart';

class CastCrewsDetails extends StatefulWidget {
  const CastCrewsDetails({Key? key}) : super(key: key);

  @override
  State<CastCrewsDetails> createState() => _CastCrewsDetailsState();
}

class _CastCrewsDetailsState extends State<CastCrewsDetails> {
  List<String> menus = ["Cast", "Crews", "Details"];

  Widget _castBody() {
    return Row(
      children: List.generate(
        AppData.casts.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppData.casts[index]),
          ),
        ),
      ),
    );
  }

  List<Widget> castCrewsBody = [
    const CastBody(),
    const CastBody(),
    const CastBody(),
  ];

  final Color active = const Color(0xFF9C4A8B);
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: List.generate(
              menus.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Chip(
                        label: Text(menus[index]),
                        backgroundColor: selectIndex == index ? active : null,
                      ),
                    ),
                    if (selectIndex == index)
                      Container(
                        width: 24,
                        height: 4,
                        color: active,
                      )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          castCrewsBody[selectIndex],
        ],
      ),
    );
  }
}

class CastBody extends StatelessWidget {
  const CastBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        AppData.casts.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppData.casts[index]),
          ),
        ),
      ),
    );
  }
}
