import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuktidea_auth_flow/shared/components/strings.dart';

class Backgrounds {
  static Widget onBoardingBackGround() {
    return SizedBox(
        height: double.infinity,
    child: Image.asset(AssetsStrings.onBoardingBackground, fit: BoxFit.cover));
  }

  static Widget onBoardingCamPNG({width,height}) {
    return Image.asset(
      AssetsStrings.onBoardingCamPNG,
      width: width?? 130 / 4,
      height: height?? 137 / 4,
    );
  }

  static Widget onBoardingHeadline() {
    return Image.asset(
      AssetsStrings.onBoardingHeadline,
      width: 827 / 4,
      height: 137 / 4,
    );
  }

  static Widget onBoardingCamSVG() {
    return SvgPicture.asset(
      AssetsStrings.onBoardingCamSvg,
      width: 130,
      height: 137,
    );
  }
}
