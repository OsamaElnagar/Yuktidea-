
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuktidea_auth_flow/models/login_model.dart';
import 'package:yuktidea_auth_flow/shared/components/components.dart';
import 'package:yuktidea_auth_flow/shared/network/end_points.dart';
import 'package:yuktidea_auth_flow/shared/network/remote/dio_helper.dart';

import '../../../models/otp_resend_model.dart';
import '../../components/strings.dart';
part 'yuktidea_state.dart';

class YuktideaCubit extends Cubit<YuktideaState> {
  YuktideaCubit() : super(YuktideaInitial());

  static YuktideaCubit get(context) => BlocProvider.of(context);
  late YuktLoginModel yuktLoginModel;
  void getNewToken()
  {
    emit(YuktideaRefreshTokenLoadingState());
     DioHelper.getData(
        path: refreshToken,
        jwtToken: jwtToken,
    ).then((value) {
      yuktLoginModel = YuktLoginModel.fromJson(value.data);
      jwtToken = yuktLoginModel.data.accessToken;
      emit(YuktideaRefreshTokenSuccessState(yuktLoginModel));
     }).catchError((onError){
       pint(onError.toString());
       emit(YuktideaRefreshTokenErrorState(onError.toString()));
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



}
