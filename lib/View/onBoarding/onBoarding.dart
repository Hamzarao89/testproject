import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syntech1/View/SignUp_view.dart';
import 'package:syntech1/res/button.dart';
import 'package:syntech1/res/color.dart';

class OnBoarding_View extends StatefulWidget {
  const OnBoarding_View({Key? key}) : super(key: key);

  @override
  State<OnBoarding_View> createState() => _OnBoarding_ViewState();
}

class _OnBoarding_ViewState extends State<OnBoarding_View> {
  PageController _controller = PageController();
  int _currPage = 0;
  List<String> img = ["images/onBoarding1.png", "images/onBoarding2.png"];
  List<String> btnName = ["Next", "Finish"];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currPage = index;
                  });
                },
                pageSnapping: true,
                itemCount: img.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Container(
                          height: height * 0.4,
                          width: width * 0.8,
                          child: Image.asset(img[index])),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                            "Lorem ipsum doloasr sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. ut labore et dolore magna aliqua"),
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      //dot bar
                    ],
                  );
                })),
          ),
          //clipper
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: img.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.backgroundColor,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ],
          ),

          //sign in btn
          SizedBox(
            height: height * 0.15,
          ),
          RoundButton(
            title: "Sign In",
            onPress: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => SignUpScreen())));
            },
            icon: Icons.forward,
          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
