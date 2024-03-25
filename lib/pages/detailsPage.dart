import 'package:flutter/material.dart';
import 'package:learnforex/widgets/apptext.dart';
import 'package:learnforex/widgets/boldtext.dart';
import '../../misc/colors.dart';
import '../../models/lessonsModel.dart';
import '../../utils/size_util.dart';
import '../../widgets/appbar.dart';

class LessonDetails extends StatefulWidget {
  const LessonDetails({
    super.key,
    required this.lesson,
    required this.index,
    required this.maxIndex,
    required this.lessons,
  });

  final LessonModel lesson;
  final int index;
  final int maxIndex;
  final List lessons;

  @override
  State<LessonDetails> createState() => _LessonDetailsState();
}

class _LessonDetailsState extends State<LessonDetails> {
  double w = mediaQueryData.size.width;
  double h = mediaQueryData.size.height;

  late LessonModel lesson;
  late int index;

  @override
  void initState() {
    super.initState();
    lesson = widget.lesson;
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
            )),
        title: lesson.title,
        titleSize: 22,
        titleColor: AppColors.mainColor,
        centerTitle: false,
        actions: const [],
      ),
      body: Container(
        height: h,
        width: w,
        padding: getPadding(all: 5, bottom: 10),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: lesson.title,
                  size: 18,
                  lines: 2,
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                AppText(text: lesson.description, size: 14, lines: 1000),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                lesson.image.isNotEmpty
                    ? Container(
                        height: h * 0.3,
                        width: w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(lesson.image),
                              fit: BoxFit.cover,
                            )),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: getVerticalSize(60),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index > 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              lesson = widget.lessons[index - 1];
                              index = index - 1;
                            });
                          },
                          child: Ink(
                            width: getHorizontalSize(w * 0.4),
                            padding: getPadding(left: 2, right: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.mainColor,
                                    style: BorderStyle.solid,
                                    width: 1),
                                color: AppColors.mainColor),
                            child: ListTile(
                              minVerticalPadding: 0,
                              horizontalTitleGap: 0,
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(
                                Icons.arrow_back,
                                size: getFontSize(18),
                                color: AppColors.white,
                              ),
                              title: const BoldText(
                                text: "Previous Lesson",
                                size: 13,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  index < widget.maxIndex
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              lesson = widget.lessons[index + 1];
                              index = index + 1;
                            });
                          },
                          child: Ink(
                            width: getHorizontalSize(w * 0.4),
                            padding: getPadding(left: 5, right: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.mainColor,
                                    style: BorderStyle.solid,
                                    width: 1),
                                color: AppColors.mainColor),
                            child: Center(
                              child: ListTile(
                                minVerticalPadding: 0,
                                horizontalTitleGap: 0,
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                leading: const BoldText(
                                  text: "Next Lesson",
                                  size: 13,
                                  color: AppColors.white,
                                ),
                                title: Icon(
                                  Icons.arrow_forward,
                                  size: getFontSize(18),
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ))
        ]),
      ),
    );
  }
}
