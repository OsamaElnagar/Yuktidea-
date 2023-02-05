import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuktidea_auth_flow/modules/onBoarding_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:yuktidea_auth_flow/shared/bloc/app_bloc/yuktidea_cubit.dart';
import 'package:yuktidea_auth_flow/shared/network/local/blocObserver.dart';
import 'package:yuktidea_auth_flow/shared/network/remote/dio_helper.dart';
import 'package:yuktidea_auth_flow/shared/styles/themes.dart';

import 'demo/hero_animate.dart';
import 'modules/home_screen.dart';
import 'modules/otp_verify_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => YuktideaCubit(),
        ),
      ],
      child: BlocConsumer<YuktideaCubit, YuktideaState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: const OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
