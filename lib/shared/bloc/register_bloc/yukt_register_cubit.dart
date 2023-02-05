import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yuktidea_auth_flow/models/login_model.dart';
import 'package:yuktidea_auth_flow/models/otp_model.dart';
import 'package:yuktidea_auth_flow/models/otp_resend_model.dart';
import 'package:yuktidea_auth_flow/shared/components/components.dart';
import 'package:yuktidea_auth_flow/shared/network/remote/dio_helper.dart';
import 'dart:async';
import '../../components/strings.dart';
import '../../network/end_points.dart';


part 'yukt_register_state.dart';

class YuktRegisterCubit extends Cubit<YuktRegisterStates> {
  YuktRegisterCubit() : super(YuktRegisterInitial());

  static YuktRegisterCubit get(context) => BlocProvider.of(context);

  bool isShown = true;
  IconData passVisibility = Icons.visibility;

  void changePasswordVisibility() {
    isShown = !isShown;
    passVisibility = isShown ? Icons.visibility : Icons.visibility_off_sharp;
    emit(YuktChangePasswordVisibilityState());
  }

  late YuktLoginModel loginModel;

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) {
    emit(YuktRegisterLoadingState());
    DioHelper.postData(
        path: register,
        data: FormData.fromMap(
          {
            "name": name,
            "email": email,
            "phone": phone,
            "password": password,
            "password_confirmation": passwordConfirmation,
          },
        )).then(
      (value) {
        loginModel = YuktLoginModel.fromJson(value.data);
        jwtToken = loginModel.data.accessToken;
        emit(YuktRegisterSuccessState(loginModel));
      },
    ).catchError((onError) {
      emit(YuktRegisterErrorState(onError.toString()));
      debugPrint(onError.toString());
    });
  }

  late OTPResendModel otpResendModel;

  void sendVerifyCode() {
    emit(YuktSendVerifyCodeLoadingState());
    DioHelper.postData(path: otpResend).then((value) {
      otpResendModel = OTPResendModel.fromJson(value.data);
      pint(otpResendModel.message);
      pint(otpResendModel.data.toString());
      emit(YuktSendVerifyCodeSuccessState(otpResendModel));
    }).catchError((onError) {
      pint(onError.toString());
      emit(YuktSendVerifyCodeErrorState(onError.toString()));
    });
  }


  Timer timer = Timer(
    const Duration(seconds: 10),
    () {},
  );
  int start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
    emit(YuktOTPExpirationPeriodState());
  }
}
