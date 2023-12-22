import 'package:flutter/material.dart';
import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/presentation/pages/profile.dart';
import 'package:letterboxd/presentation/widgets/home_body.dart';
import 'package:letterboxd/presentation/widgets/home_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> navBody = [
    const HomeBody(),
    const HomeBody(),
    const HomeBody(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex != 3
          ? AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Image.asset(AppAssets.leading),
                );
              }),
              actions: [
                const SizedBox(width: 50, height: 20),
                Stack(
                  children: const [
                    CircleAvatar(
                      radius: 43,
                      backgroundImage: AssetImage(AppAssets.avatar),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.red,
                      ),
                    )
                  ],
                ),
              ],
            )
          : null,
      drawer: const HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        iconSize: 20,
        // fixedColor: Colors.red,
        selectedItemColor: const Color(0xFFE9A6A6),
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Color(0xFFE9A6A6)),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: currentIndex == 0
                  ? const Color(0xFFE9A6A6)
                  : const Color(0xFF8F8E9B),
            ),
            label: currentIndex == 0 ? '___' : '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.history,
              height: 20,
              width: 20,
              color: currentIndex == 1
                  ? const Color(0xFFE9A6A6)
                  : const Color(0xFF8F8E9B),
            ),
            label: currentIndex == 1 ? '___' : '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.notification,
              height: 20,
              width: 20,
              color: currentIndex == 2
                  ? const Color(0xFFE9A6A6)
                  : const Color(0xFF8F8E9B),
            ),
            label: currentIndex == 2 ? '___' : '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.user,
              height: 20,
              width: 20,
              color: currentIndex == 3
                  ? const Color(0xFFE9A6A6)
                  : const Color(0xFF8F8E9B),
            ),
            label: currentIndex == 3 ? '___' : '',
          ),
        ],
      ),
      body: navBody[currentIndex],
    );
  }
}
