import 'package:flutter/material.dart';
import 'package:yuktidea_auth_flow/modules/login_screen.dart';
import 'package:yuktidea_auth_flow/shared/components/backgrounds.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_auth_flow/shared/styles/colors.dart';
import 'package:yuktidea_auth_flow/shared/styles/paddings.dart';

import '../shared/components/components.dart';
import '../shared/components/strings.dart';
import '../shared/styles/fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Backgrounds.onBoardingBackGround(),
          YuktPaddings.yuktAuthPadding(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Backgrounds.onBoardingCamPNG(),
                    const SizedBox(
                      width: 25 / 4,
                    ),
                    Backgrounds.onBoardingHeadline(),
                  ],
                ),
                const Spacer(),
                yuktNormalTexts(
                    norText: YuktBoardingStrings.onBoardingL1,
                    fw: FontWeight.w700),
                yuktSpacer(height: 5.0),
                yuktNormalTexts(
                    norText: YuktBoardingStrings.onBoardingL2,
                    fw: FontWeight.w600,
                    fs: 13.0),
                yuktSpacer(height: 25.0),
                Hero(
                  tag: 'redButton',
                  child: yuktButton(
                      string: YuktBoardingStrings.getStarted,
                      onPressed: () {
                        navigate2(context, const LoginScreen());
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
