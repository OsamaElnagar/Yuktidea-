import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_auth_flow/modules/login_screen.dart';
import 'package:yuktidea_auth_flow/modules/otp_verify_screen.dart';
import 'package:yuktidea_auth_flow/shared/bloc/register_bloc/yukt_register_cubit.dart';
import 'package:yuktidea_auth_flow/shared/network/local/cache_helper.dart';
import 'package:yuktidea_auth_flow/shared/styles/colors.dart';
import '../shared/components/components.dart';
import '../shared/components/strings.dart';
import '../shared/styles/form_fields.dart';
import '../shared/styles/paddings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  FocusNode emailNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode passNode = FocusNode();
  FocusNode passConfNode = FocusNode();

  void focusNode(FocusNode node) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YuktRegisterCubit(),
      child: BlocConsumer<YuktRegisterCubit, YuktRegisterStates>(
        listener: (context, state) {
          var listenerCubit = YuktRegisterCubit.get(context);
          if (state is YuktRegisterSuccessState) {
            if (state.loginModel.status == true) {
              debugPrint(state.loginModel.message.toString());
              listenerCubit.sendVerifyCode();
              if(listenerCubit.otpResendModel.status ==true){
                showToast(
                  msg: listenerCubit.otpResendModel.message,
                  state: ToastStates.success,
                );
              }
              showToast(
                msg: state.loginModel.message,
                state: ToastStates.success,
              );
              navigateTo(context, const PhoneNumberVerifyScreen());
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
          var cubit = YuktRegisterCubit.get(context);
          double screenHeight = MediaQuery.of(context).size.height;
          return Scaffold(
              backgroundColor: YuktColors.yuktBlack,
              body: GestureDetector(
                onTap: () => unFocusNodes(
                    [nameNode, emailNode, phoneNode, passNode, passConfNode]),
                child: YuktPaddings.yuktAuthPadding(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: screenHeight,
                      child: Column(
                        children: [
                          yuktHeadlines(
                              headline: YuktRegisterStrings.registerHeadline),
                          yuktNormalTexts(
                              norText: YuktRegisterStrings.registerYourAccount,
                              fw: FontWeight.w600),
                          yuktSpacer(height: screenHeight / 14),
                          SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  YuktFormFields.yuktTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' name $validationHint';
                                        }
                                        return null;
                                      },
                                      focusNode: nameNode,
                                      keyboardType: TextInputType.name,
                                      controller: nameController,
                                      textInputAction: TextInputAction.next,
                                      hintText:
                                          YuktRegisterStrings.registerName,
                                      label: 'name'),
                                  yuktSpacer(height: 10.0),
                                  YuktFormFields.yuktTextFormField(
                                    textInputAction: TextInputAction.next,
                                    focusNode: emailNode,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    hintText: YuktRegisterStrings.registerEmail,
                                    label: 'email',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ' email $validationHint';
                                      }
                                      return null;
                                    },
                                  ),
                                  yuktSpacer(height: 10.0),
                                  YuktFormFields.yuktTextFormField(
                                      textInputAction: TextInputAction.next,
                                      focusNode: phoneNode,
                                      keyboardType: TextInputType.phone,
                                      controller: phoneController,
                                      hintText:
                                          YuktRegisterStrings.registerPhNo,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length != 10) {
                                          return ' phone $validationHint or not 10 digits.';
                                        }
                                        return null;
                                      },
                                      label: 'phone'),
                                  yuktSpacer(height: 10.0),
                                  YuktFormFields.yuktPasswordFormField(
                                      label: 'password',
                                      textInputAction: TextInputAction.next,
                                      focusNode: passNode,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: passwordController,
                                      hintText: YuktRegisterStrings.regPassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' password $validationHint';
                                        }
                                        return null;
                                      },
                                      registerCubit: cubit),
                                  yuktSpacer(height: 10.0),
                                  YuktFormFields.yuktPasswordFormField(
                                    label: 'password confirmation',
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ' password $validationHint';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context).unfocus();
                                      // if(passwordController.text
                                      //     != passwordConfirmationController.text
                                      // ){
                                      //   return 'Not identical,check gain';
                                      // }
                                    },
                                    focusNode: passConfNode,
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordConfirmationController,
                                    hintText: YuktRegisterStrings.confPassword,
                                    registerCubit: cubit,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          yuktSpacer(height: screenHeight / 12),
                          yuktButton(
                              string: YuktRegisterStrings.register,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  YuktRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        passwordConfirmationController.text,
                                  );
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              yuktHints(hint: YuktRegisterStrings.haveAccount),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, const LoginScreen());
                                },
                                child: Text(
                                  YuktRegisterStrings.login,
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
              ));
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordController.dispose();
    YuktRegisterCubit().close();
    super.dispose();
  }
}
