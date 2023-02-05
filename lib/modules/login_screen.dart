import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_auth_flow/modules/home_screen.dart';
import 'package:yuktidea_auth_flow/modules/register_screen.dart';
import 'package:yuktidea_auth_flow/shared/bloc/login_bloc/yukt_login_cubit.dart';
import 'package:yuktidea_auth_flow/shared/bloc/login_bloc/yukt_login_cubit.dart';
import 'package:yuktidea_auth_flow/shared/styles/colors.dart';
import '../shared/components/components.dart';
import '../shared/components/strings.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/styles/paddings.dart';
import '../shared/styles/form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YuktLoginCubit(),
      child: BlocConsumer<YuktLoginCubit, YuktLoginStates>(
        listener: (context, state) {
          var listenerCubit = YuktLoginCubit.get(context);

          if (state is YuktLoginSuccessState) {
            if (state.loginModel.status == true) {
              debugPrint(state.loginModel.message.toString());
              // listenerCubit.sendVerifyCode();
              // if (listenerCubit.otpModel.status == true) {
              //   showToast(
              //     msg: listenerCubit.otpModel.message,
              //     state: ToastStates.success,
              //   );
              // }
              showToast(
                msg: state.loginModel.message,
                state: ToastStates.success,
              );
              navigate2(context, const HomeScreen());
            } else {
              debugPrint(state.loginModel.message.toString());
              showToast(
                msg: state.loginModel.message,
                state: ToastStates.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = YuktLoginCubit.get(context);
          return Scaffold(
            backgroundColor: YuktColors.yuktBlack,
            body: GestureDetector(
              onTap: () => unFocusNodes([emailNode, passwordNode]),
              child: YuktPaddings.yuktAuthPadding(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      yuktHeadlines(headline: YuktLoginStrings.loginHeadline),
                      yuktNormalTexts(
                          norText: YuktLoginStrings.loginYourAccount,
                          fw: FontWeight.w600),
                      const Spacer(),
                      SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              YuktFormFields.yuktTextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  controller: emailController,
                                  label: 'Email',
                                  focusNode: emailNode,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' email $validationHint';
                                    }
                                    return null;
                                  },
                                  hintText: YuktLoginStrings.loginEmOrPh),
                              yuktSpacer(height: 20.0),
                              YuktFormFields.yuktPasswordFormField(
                                focusNode: passwordNode,
                                textInputAction: TextInputAction.go,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                hintText: YuktLoginStrings.password,
                                loginCubit: cubit,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' password $validationHint';
                                  }
                                  return null;
                                },
                                onChanged: (s) {
                                  if (cubit.isShown == false) {
                                    cubit.changePasswordVisibility();
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  child: yuktHints(
                                      hint: YuktLoginStrings.forgotPassword,
                                      textAlign: TextAlign.left),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Hero(
                        tag: 'redButton',
                        child: yuktButton(
                          string: YuktLoginStrings.login,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              YuktLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          yuktHints(hint: YuktLoginStrings.donHaveAccount),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, const RegisterScreen());
                            },
                            child: Text(
                              YuktLoginStrings.signup,
                              style: GoogleFonts.montserrat(
                                color: YuktColors.yuktRed,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    YuktLoginCubit().close();
    super.dispose();
  }
}
