import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuktidea_auth_flow/modules/login_screen.dart';
import 'package:yuktidea_auth_flow/shared/bloc/app_bloc/yuktidea_cubit.dart';
import 'package:yuktidea_auth_flow/shared/components/backgrounds.dart';
import 'package:yuktidea_auth_flow/shared/components/components.dart';
import 'package:yuktidea_auth_flow/shared/components/strings.dart';
import 'package:yuktidea_auth_flow/shared/styles/colors.dart';

import '../shared/network/end_points.dart';
import '../shared/styles/paddings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<YuktideaCubit, YuktideaState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = YuktideaCubit.get(context);
        return Scaffold(
          backgroundColor: YuktColors.yuktBlack,
          body: YuktPaddings.yuktAuthPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Backgrounds.onBoardingCamPNG(width: 75.0, height: 75.0),
                yuktSpacer(),
                Backgrounds.onBoardingHeadline(),
                yuktSpacer(),
                yuktHeadlines(headline: YuktHomeStrings.home),
                yuktSpacer(),
                yuktButton(string: 'Refresh Token', onPressed: () {},),
              ],
            ),
          ),
        );
      },
    );
  }
}
