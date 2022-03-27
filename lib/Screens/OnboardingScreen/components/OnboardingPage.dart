import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wesafeapp/utils/constants.dart';

class OnboardingPage extends StatelessWidget {
  final Color color;
  final String urlImage;
  final String title;
  final String subTitle;

  const OnboardingPage(
      {Key? key,
      required this.color,
      required this.urlImage,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            urlImage,
            height: size.height * 0.25,
            // fit: BoxFit.cover,
            // width: double.infinity,
          ),
          const SizedBox(height: 64),
          Text(
            title,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subTitle,
              style: const TextStyle(color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
