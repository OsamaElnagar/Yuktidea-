part of 'yuktidea_cubit.dart';

@immutable
abstract class YuktideaState {}

class YuktideaInitial extends YuktideaState {}

class YuktideaRefreshTokenLoadingState extends YuktideaState {}

class YuktideaRefreshTokenSuccessState extends YuktideaState {
  final YuktLoginModel yuktLoginModel;

  YuktideaRefreshTokenSuccessState(this.yuktLoginModel);
}

class YuktideaRefreshTokenErrorState extends YuktideaState {
  final String error;

  YuktideaRefreshTokenErrorState(this.error);
}
class YuktSendVerifyCodeLoadingState extends YuktideaState {}

class YuktSendVerifyCodeSuccessState extends YuktideaState {
  final OTPResendModel otpResendModel;

  YuktSendVerifyCodeSuccessState(this.otpResendModel);
}

class YuktSendVerifyCodeErrorState extends YuktideaState {
  final String error;

  YuktSendVerifyCodeErrorState(this.error);
}

class YuktDelUserLoadingState extends YuktideaState {}

class YuktDelUserSuccessState extends YuktideaState {
  final OTPResendModel otpResendModel;

  YuktDelUserSuccessState(this.otpResendModel);
}

class YuktDelUserErrorState extends YuktideaState {
  final String error;

  YuktDelUserErrorState(this.error);
}


class YuktGetUserLoadingState extends YuktideaState {}

class YuktGetUserSuccessState extends YuktideaState {
  final YuktUserModel yuktUserModel;

  YuktGetUserSuccessState(this.yuktUserModel);
}

class YuktGetUserErrorState extends YuktideaState {
  final String error;

  YuktGetUserErrorState(this.error);
}
