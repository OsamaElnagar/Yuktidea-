import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_auth_flow/shared/styles/colors.dart';

class YuktTextStyles {
  static yuktRegMontserrat({color, fw, fs}) {
    return GoogleFonts.montserrat(
      color: color ?? YuktColors.yuktWhite,
      fontWeight: fw ?? FontWeight.w500,
      fontSize: fs ?? 40/3,
    );
  }

  static yuktHintMontserrat({color, fw, fs}) {
    return GoogleFonts.montserrat(
      color: color ?? YuktColors.yuktGrey,
      fontWeight: fw ?? FontWeight.w600,
      fontSize: fs ?? 30 / 2,
    );
  }

  static yuktHeadlines({color, fw, fs}) {
    return GoogleFonts.montserrat(
      color: color ?? YuktColors.yuktWhite,
      fontWeight: fw ?? FontWeight.w700,
      fontSize: fs ?? 25,
    );
  }
}
