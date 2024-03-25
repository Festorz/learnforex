import 'package:flutter/material.dart';
import 'package:learnforex/misc/colors.dart';
import 'package:learnforex/pages/homePage.dart';

import '../data/data.dart';
import '../widgets/appbutton.dart';
import '../widgets/apptext.dart';
import '../widgets/boldtext.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController controller = PageController(initialPage: 0);

  var currentPageValue = 0;

  List images = [
    "forex.jpeg",
    "forex2.jpeg",
    "forex3.jpeg",
    "forex4.jpeg",
    "forex5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(children: [
        Positioned(
          child: PageView.builder(
            itemCount: sliders.length,
            onPageChanged: (value) {
              setState(() {
                currentPageValue = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/sliders/${images[index]}"),
                      fit: BoxFit.cover,
                      opacity: 0.9),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.5,
                      ),
                      BoldText(
                          text: sliders[index].title,
                          size: 25,
                          color: Colors.amber[700]),
                      const SizedBox(height: 20),
                      AppText(
                          text: sliders[index].description,
                          lines: 5,
                          size: 16,
                          color: Colors.white),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 40,
          right: 10,
          child: Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                child: const AppText(
                  text: "Skip",
                  size: 16,
                  color: AppColors.white,
                )),
          ),
        ),
        Positioned(
            bottom: h * 0.1,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    if (currentPageValue < sliders.length - 1) {
                      controller.animateToPage(
                        currentPageValue + 1,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.ease,
                      );
                      // print("index is $currentPageValue");
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    }
                  },
                  child: AppButton(
                      color: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      text: sliders.length == currentPageValue + 1
                          ? "Get Started"
                          : "Next",
                      size: w * 0.8,
                      borderColor: Colors.white12),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(sliders.length, (indexdots) {
                    return Container(
                      margin: const EdgeInsets.only(left: 2),
                      height: 8,
                      width: currentPageValue == indexdots ? 20 : 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: currentPageValue == indexdots
                              ? Colors.white
                              : Colors.white70),
                    );
                  }),
                )
              ],
            ))
      ]),
    );
  }
}
