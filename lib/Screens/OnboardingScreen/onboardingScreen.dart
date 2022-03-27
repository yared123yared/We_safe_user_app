import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wesafeapp/Screens/Login/components/background.dart';
import 'package:wesafeapp/Screens/Login/login_screen.dart';
import 'package:wesafeapp/utils/constants.dart';

import 'components/OnboardingPage.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child:  Background(
          child: PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            controller: controller,
            children: <Widget>[
              OnboardingPage(
                color: Colors.green.shade100,
                urlImage: "assets/images/onboarding_image_1.png",
                title: "First Page",
                subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              ),
              OnboardingPage(
                color: Colors.green.shade100,
                urlImage: "assets/images/onboarding_image_2.png",
                title: "Second Page",
                subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              ),
              OnboardingPage(
                color: Colors.green.shade100,
                urlImage: "assets/images/onboarding_image_3.png",
                title: "Last Page",
                subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: isLastPage?
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen())
                );
              },
              // style: ButtonStyle(
              //   backgroundColor: Colors.transparent
              // ),
              child: const Center(child: Text('Get Started', style: TextStyle( fontSize: 24, color: kPrimaryColor))),
              // style: TextButton.styleFrom(
              //   // shape: RoundedRectangleBorder(
              //   //   borderRadius: BorderRadius.circular(5)
              //   // ),
              //   // primary: kPrimaryColor,
              //   // backgroundColor: Colors.white,
              //   //   textStyle: const TextStyle(
              //   //       fontSize: 14, fontWeight: FontWeight.w500),
              //   // minimumSize: const Size.fromHeight(80)
              // ),
            ):
            Container(
              color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: ()=>controller.jumpToPage(2), child: const Text('SKIP', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500))),
              Center(
                child: SmoothPageIndicator(
                  controller:controller,
                  count: 3,
                  effect: const WormEffect(
                    spacing: 16,
                    dotColor: Colors.black26,
                    activeDotColor: kPrimaryColor
                  ),
                  onDotClicked: (index) => controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                ),
              ),
              TextButton(onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut), child: const Text('NEXT', style: TextStyle(color: kPrimaryColor),)),
            ],
          ),
        ),
      ),
    );
  }
}
