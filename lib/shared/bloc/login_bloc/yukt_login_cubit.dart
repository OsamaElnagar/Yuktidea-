import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuktidea_auth_flow/models/otp_resend_model.dart';
import 'package:yuktidea_auth_flow/shared/network/remote/dio_helper.dart';
import 'package:yuktidea_auth_flow/shared/network/remote/http_survice.dart';
import '../../../models/login_model.dart';
import '../../../models/otp_model.dart';
import '../../components/components.dart';
import '../../components/strings.dart';
import '../../network/end_points.dart';

part 'yukt_login_state.dart';

class YuktLoginCubit extends Cubit<YuktLoginStates> {
  YuktLoginCubit() : super(YuktLoginInitial());

  static YuktLoginCubit get(context) => BlocProvider.of(context);

  bool isShown = true;
  IconData passVisibility = Icons.visibility;

  void changePasswordVisibility() {
    isShown = !isShown;
    passVisibility = isShown ? Icons.visibility : Icons.visibility_off_sharp;
    emit(ShopChangePasswordVisibilityState());
  }

  late YuktLoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(YuktLoginLoadingState());
    DioHelper.postData(
        path: login,
        data: FormData.fromMap({
          'login': email,
          'password': password,
        })).then(
      (value) {
        loginModel = YuktLoginModel.fromJson(value.data);
        jwtToken = loginModel.data.accessToken;
        printFulltext(loginModel.status.toString());
        printFulltext(loginModel.data.accessToken.toString());
        emit(YuktLoginSuccessState(loginModel));
      },
    ).catchError((onError) {
      emit(YuktLoginErrorState(onError.toString()));
      pint(onError.toString());
    });
  }

  late OTPModel otpModel;
  late OTPResendModel otpResendModel;

  void sendVerifyCode() {
    emit(YuktSendVerifyCodeLoadingState());
    DioHelper.postData(
      path: otpResend,
    ).then((value) {
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
