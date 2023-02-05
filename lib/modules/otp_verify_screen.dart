import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuktidea_auth_flow/shared/bloc/register_bloc/yukt_register_cubit.dart';
import 'package:yuktidea_auth_flow/shared/styles/colors.dart';
import 'package:yuktidea_auth_flow/shared/styles/fonts.dart';
import '../shared/components/components.dart';
import '../shared/components/strings.dart';
import '../shared/styles/paddings.dart';

class PhoneNumberVerifyScreen extends StatefulWidget {
  const PhoneNumberVerifyScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberVerifyScreen> createState() =>
      _PhoneNumberVerifyScreenState();
}

class _PhoneNumberVerifyScreenState extends State<PhoneNumberVerifyScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  TextInputAction oneCharVerify() {
    return TextInputAction.next;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YuktRegisterCubit(),
      child: BlocConsumer<YuktRegisterCubit, YuktRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = YuktRegisterCubit.get(context);
          return Scaffold(
            backgroundColor: YuktColors.yuktBlack,
            body: YuktPaddings.yuktAuthPadding(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    yuktHeadlines(
                        headline: YuktPhoneVerifyStrings.verifyHeadline),
                    yuktNormalTexts(
                        norText: YuktPhoneVerifyStrings.enterOTP,
                        fw: FontWeight.w600),
                    const Spacer(),
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildOTPBox(number: 8);
                          },
                          separatorBuilder: (context, index) {
                            return yuktSpacer(
                              width: 5.0,
                            );
                          },
                          itemCount: 4),
                    ),
                    yuktSpacer(),
                    RichText(
                      text: TextSpan(
                        text: YuktPhoneVerifyStrings.expireIn,
                        style: const TextStyle(
                            color: YuktColors.yuktWhite, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${cubit.start} seconds',
                            style: const TextStyle(
                              color: YuktColors.yuktRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    yuktSpacer(height: 50.0),
                    yuktButton(
                        string: YuktPhoneVerifyStrings.verify,
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildOTPBox({required int number}) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: YuktColors.yuktGrey,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            oneCharVerify();
          }
        },
        style: YuktTextStyles.yuktHeadlines(fs: 30.0),
        textAlign: TextAlign.center,
        textInputAction: oneCharVerify(),
        cursorHeight: 35,
        validator: (value) {
          if (value!.isEmpty) {
            return ' otp $validationHint';
          }

          return null;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: YuktColors.yuktRed, width: 3)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: YuktColors.yuktGrey, width: 3),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    YuktRegisterCubit.get(context).timer.cancel();
    YuktRegisterCubit().close();
  }
}
