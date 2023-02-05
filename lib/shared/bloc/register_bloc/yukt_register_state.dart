part of 'yukt_register_cubit.dart';

@immutable
abstract class YuktRegisterStates {}

class YuktRegisterInitial extends YuktRegisterStates {}

class YuktChangePasswordVisibilityState extends YuktRegisterStates {}

class YuktRegisterLoadingState extends YuktRegisterStates {}

class YuktRegisterSuccessState extends YuktRegisterStates {
  final YuktLoginModel loginModel;

  YuktRegisterSuccessState(this.loginModel);
}

class YuktRegisterErrorState extends YuktRegisterStates {
  final String error;

  YuktRegisterErrorState(this.error);
}

class YuktSendVerifyCodeLoadingState extends YuktRegisterStates {}

class YuktSendVerifyCodeSuccessState extends YuktRegisterStates {
  final OTPResendModel otpResendModel;

  YuktSendVerifyCodeSuccessState(this.otpResendModel);
}

class YuktSendVerifyCodeErrorState extends YuktRegisterStates {
  final String error;

  YuktSendVerifyCodeErrorState(this.error);
}

class YuktOTPExpirationPeriodState extends YuktRegisterStates {}
