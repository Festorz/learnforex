import 'package:flutter/material.dart';
import 'package:learnforex/misc/colors.dart';
import 'package:learnforex/pages/detailsPage.dart';
import 'package:learnforex/widgets/appbar.dart';
import 'package:learnforex/widgets/boldtext.dart';
import 'package:learnforex/widgets/side_bar_navigation.dart';

import '../data/lessons.dart';
import '../utils/size_util.dart';
import '../widgets/apptext.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  double w = mediaQueryData.size.width;
  double h = mediaQueryData.size.height;

  String currentLesson = '';
  List forex = [];

  @override
  void initState() {
    super.initState();
    forex = forexLessons;
    currentLesson = 'Forex';
  }

  List lessons = [
    {
      "title": "Forex",
      "lessons": forexLessons,
    },
    {
      "title": "Trade",
      "lessons": tradeLessons,
    },
    {
      "title": "Sessions",
      "lessons": sessionsLessons,
    },
    {
      "title": "Expert",
      "lessons": expertLessons,
    },
    {
      "title": "Reasons",
      "lessons": reasonsLessons,
    },
    {
      "title": "Margins",
      "lessons": marginLessons,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.white,
      drawer: DrawerNavigationBar(
        close: toggleDrawer,
      ),
      appBar: CustomAppBar(
        title: 'FOREX',
        centerTitle: false,
        titleSize: 25,
        titleColor: AppColors.mainColor,
        actions: [
          Padding(
            padding: getPadding(right: 14),
            child: const Icon(Icons.notifications_none),
          ),
          Padding(
            padding: getPadding(right: 5),
            child: const Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
      body: Container(
        height: h,
        width: h,
        margin: getMargin(left: 5, right: 5, top: 10),
        padding: getPadding(bottom: 10),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: getPadding(top: 5, right: 20, left: 20, bottom: 10),
              height: getVerticalSize(200),
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[800]!, Colors.green],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoldText(
                      text: "Forex Lessons", size: 25, color: AppColors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  const AppText(
                      text: "Learn Forex Here",
                      size: 15,
                      color: AppColors.white),
                  Expanded(child: Container()),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white54,
                                blurRadius: 10,
                                offset: Offset(4, 8)),
                          ]),
                      child: const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: double.maxFinite,
                height: 100,
                margin: getMargin(top: 20, bottom: 20),
                child: ListView.builder(
                  itemCount: lessons.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          forex = lessons.elementAt(index)['lessons'];
                          currentLesson = lessons.elementAt(index)['title'];
                        });
                      },
                      child: Container(
                        width: getHorizontalSize(w * 0.2),
                        alignment: Alignment.center,
                        margin: getMargin(right: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: currentLesson ==
                                        lessons.elementAt(index)['title']
                                    ? AppColors.white
                                    : AppColors.mainColor,
                                width: 2),
                            color: currentLesson ==
                                    lessons.elementAt(index)['title']
                                ? AppColors.mainColor
                                : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.mainColor,
                                  blurRadius: 10,
                                  offset: const Offset(4, 6)),
                            ]),
                        child: AppText(
                          text: lessons.elementAt(index)['title'].toString(),
                          size: 12,
                          color:
                              currentLesson == lessons.elementAt(index)['title']
                                  ? AppColors.white
                                  : AppColors.textColor,
                        ),
                      ),
                    );
                  },
                )),
            // SizedBox(
            //   height: getVerticalSize(h * 0.5),
            //   width: w,
            //   child: ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     itemCount: forexLessons.length,
            //     itemBuilder: (context, index) {
            //       return Ink(
            //           decoration: BoxDecoration(
            //             border: Border(
            //               top: BorderSide(
            //                   color: AppColors.mainColor, strokeAlign: 2),
            //               bottom: BorderSide(
            //                   color: AppColors.mainColor, strokeAlign: 2),
            //             ),
            //           ),
            //           child: ListTile(
            //             leading: Icon(
            //               Icons.play_circle,
            //               color: AppColors.mainColor,
            //             ),
            //             title: const AppText(text: "What is forex", size: 15),
            //           ));
            //     },
            //   ),
            // ),

            Column(
                children: List.generate(forex.length, (index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LessonDetails(
                            lesson: forex[index],
                            index: index,
                            maxIndex: forex.length - 1,
                            lessons: forex),
                      ));
                    },
                    leading: Icon(
                      Icons.play_circle,
                      color: AppColors.mainColor,
                    ),
                    title: AppText(text: forex[index].title, size: 15),
                  ),
                  Divider(height: 2, color: AppColors.mainColor),
                ],
              );
            }))
          ],
        )),
      ),
    );
  }

  toggleDrawer() async {
    if (_key.currentState!.isDrawerOpen) {
      _key.currentState!.openEndDrawer();
    } else {
      _key.currentState!.openDrawer();
    }
  }
}
