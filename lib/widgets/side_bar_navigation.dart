import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnforex/data/lessons.dart';
import 'package:learnforex/pages/detailsPage.dart';
import 'package:learnforex/widgets/boldtext.dart';
import '../../utils/size_util.dart';

import '../misc/colors.dart';
import 'apptext.dart';

class DrawerNavigationBar extends StatefulWidget {
  const DrawerNavigationBar({Key? key, required this.close}) : super(key: key);
  final void Function() close;

  @override
  State<DrawerNavigationBar> createState() => _DrawerNavigationBarState();
}

class _DrawerNavigationBarState extends State<DrawerNavigationBar> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();

    double w = mediaQueryData.size.width;
    double h = mediaQueryData.size.height;

    Color bgcolor = AppColors.white;

    return Drawer(
      backgroundColor: bgcolor,
      surfaceTintColor: bgcolor,
      width: w * 0.7,
      key: key,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        margin: getMargin(top: 45),
        height: h,
        color: bgcolor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                padding: getPadding(top: 20, bottom: 10),
                child: InkWell(onTap: () {}, child: buildHeader())),
            SizedBox(height: getVerticalSize(3)),
            const Divider(
              color: AppColors.fadedBlack,
            ),
            SizedBox(height: getVerticalSize(1)),
            buildMenuItem(
              icon: Icons.home,
              text: "Home",
              height: h,
              onClicked: () {
                widget.close();
              },
            ),
            buildMenuItem(
              icon: Icons.bookmark,
              text: "Forex Lessons",
              height: h,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LessonDetails(
                      lesson: forexLessons[0],
                      index: 0,
                      maxIndex: forexLessons.length - 1,
                      lessons: forexLessons),
                ));
              },
            ),
            buildMenuItem(
              icon: Icons.bookmark,
              text: "Trading Lessons",
              height: h,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LessonDetails(
                      lesson: tradeLessons[0],
                      index: 0,
                      maxIndex: tradeLessons.length - 1,
                      lessons: tradeLessons),
                ));
              },
            ),
            buildMenuItem(
              icon: Icons.bookmark,
              text: "Trading sessions Lessons",
              height: h,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LessonDetails(
                      lesson: sessionsLessons[0],
                      index: 0,
                      maxIndex: sessionsLessons.length - 1,
                      lessons: sessionsLessons),
                ));
              },
            ),
            buildMenuItem(
              icon: Icons.bookmark,
              text: "Forex Expert Lessons",
              height: h,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LessonDetails(
                      lesson: expertLessons[0],
                      index: 0,
                      maxIndex: expertLessons.length - 1,
                      lessons: expertLessons),
                ));
              },
            ),
            buildMenuItem(
              icon: Icons.bookmark,
              text: "Why Trade Lessons",
              height: h,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LessonDetails(
                      lesson: reasonsLessons[0],
                      index: 0,
                      maxIndex: reasonsLessons.length - 1,
                      lessons: reasonsLessons),
                ));
              },
            ),
            buildMenuItem(
              icon: Icons.bookmark,
              text: "Forex Margins Lessons",
              height: h,
              onClicked: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LessonDetails(
                      lesson: marginLessons[0],
                      index: 0,
                      maxIndex: marginLessons.length - 1,
                      lessons: marginLessons),
                ));
              },
            ),
            buildMenuItem(
              icon: Icons.send,
              height: h,
              text: "Share App",
              onClicked: () {},
            ),
            SizedBox(height: getVerticalSize(5)),
            const Divider(
              color: AppColors.fadedBlack,
            ),
            SizedBox(height: getVerticalSize(5)),
            buildMenuItem(
              icon: Icons.logout,
              height: h,
              text: "Exit",
              onClicked: () {
                SystemNavigator.pop();
                widget.close();
              },
            ),
            SizedBox(height: getVerticalSize(5)),
            const Divider(
              color: AppColors.fadedBlack,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      VoidCallback? onClicked,
      required double height}) {
    var color = Colors.black87;
    final leading =
        Icon(icon, color: AppColors.mainColor, size: getFontSize(22));

    return Container(
      margin: getMargin(top: 10),
      padding: getPadding(left: 10),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          dense: true,
          minVerticalPadding: 0,
          leading: leading,
          // contentPadding:  EdgeInsets.all(0),
          title: AppText(
            text: text,
            color: color,
            size: 13,
          ),
          onTap: onClicked,
        ),
      ),
    );
  }

  Widget buildHeader() => Padding(
        padding: getPadding(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: getHorizontalSize(80),
                  height: getVerticalSize(80),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/forex.jpeg"),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: Colors.transparent
                      // border: Border.all(color: Colors.black),
                      ),
                ),
                Expanded(child: Container()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppText(
                        text: 'Forex DotNet',
                        size: 20,
                        color: AppColors.mainColor,
                        bold: true,
                      ),
                      const SizedBox(height: 10),
                      const BoldText(
                        text: 'Welcome',
                        size: 12,
                        color: AppColors.black,
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getVerticalSize(15)),
            Padding(
              padding: getPadding(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.watch_later,
                    size: getFontSize(25),
                    color: AppColors.mainColor,
                  ),
                  SizedBox(
                    width: getHorizontalSize(15),
                  ),
                  const AppText(
                    text: "Learn forex in 60 mins",
                    size: 14,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  void openUrl(String url) async {}
}
