part of 'yukt_login_cubit.dart';

@immutable
abstract class YuktLoginStates {}

class YuktLoginInitial extends YuktLoginStates {}
class ShopChangePasswordVisibilityState extends YuktLoginStates {}




class YuktLoginLoadingState extends YuktLoginStates {}

class YuktLoginSuccessState extends YuktLoginStates {
  final YuktLoginModel loginModel;

  YuktLoginSuccessState(this.loginModel);
}

class YuktLoginErrorState extends YuktLoginStates {
  final String error;

  YuktLoginErrorState(this.error);
}

class YuktSendVerifyCodeLoadingState extends YuktLoginStates {}

class YuktSendVerifyCodeSuccessState extends YuktLoginStates {
  final OTPResendModel otpResendModel;

  YuktSendVerifyCodeSuccessState(this.otpResendModel);
}

class YuktSendVerifyCodeErrorState extends YuktLoginStates {
  final String error;

  YuktSendVerifyCodeErrorState(this.error);
}
