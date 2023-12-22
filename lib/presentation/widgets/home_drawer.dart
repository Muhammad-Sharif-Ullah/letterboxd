import 'package:flutter/material.dart';
import 'package:letterboxd/constants/app_assets.dart';
import 'package:letterboxd/constants/app_textStyle.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int currentIndex = 0;
  final List<Map<String, String>> drawerTiles = [
    {"Home": AppAssets.home},
    {"Films": AppAssets.films},
    {"Diary": AppAssets.diary},
    {"Reviews": AppAssets.reviews},
    {"Watch List": AppAssets.watchList},
    {"Lists": AppAssets.list},
    {"Likes": AppAssets.likes},
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(AppAssets.avatar),
                ),
                const SizedBox(width: 14),
                RichText(
                  text: TextSpan(
                    text: "Kyran",
                    style: AppStyle.drawerAvatarTitle,
                    children: [
                      TextSpan(
                          text: "\n@kyran_d",
                          style: AppStyle.drawerAvatarSubTItle)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: AppStyle.followerOutlineButton,
                  child: Text(
                    "500 Followers",
                    style: AppStyle.outlineButtonText
                        .copyWith(color: Colors.white),
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  style: AppStyle.followerOutlineButton,
                  child: Text(
                    "500 Followings",
                    style: AppStyle.outlineButtonText
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            for (int i = 0; i < drawerTiles.length; i++)
              RawMaterialButton(
                fillColor: currentIndex == i ? const Color(0xFFE9A6A6) : null,
                onPressed: () {
                  setState(() {
                    currentIndex = i;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        drawerTiles[i].entries.first.value,
                        height: 25,
                        width: 25,
                        color: currentIndex == i ? Colors.black : Colors.grey,
                      ),
                      const SizedBox(width: 17),
                      Text(
                        drawerTiles[i].entries.first.key,
                        style: currentIndex == i
                            ? AppStyle.drawerTileTextActive.copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold)
                            : AppStyle.drawerTileTextInactive.copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 50),
            RawMaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.logout,
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(width: 17),
                    Text(
                      "Logout",
                      style: AppStyle.drawerTileTextActive.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
