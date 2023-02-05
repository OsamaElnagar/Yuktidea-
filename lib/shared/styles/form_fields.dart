import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuktidea_auth_flow/shared/bloc/register_bloc/yukt_register_cubit.dart';

import '../bloc/login_bloc/yukt_login_cubit.dart';
import 'colors.dart';
import 'fonts.dart';

class YuktFormFields {
  static Container yuktTextFormField(
      {hintText,
      String? label,
      String? Function(String?)? validator,
      onFieldSubmitted,
      onChanged,
      required controller,
      required keyboardType,
      focusNode,
      textInputAction,
      }) {
    return Container(
      height: 70,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: TextFormField(
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.montserrat(
          color: YuktColors.yuktWhite,
        ),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: YuktColors.yuktRed),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: YuktColors.yuktGrey),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
                color: YuktColors.yuktGrey, fontWeight: FontWeight.w600),
            focusColor: YuktColors.yuktRed,
            contentPadding: const EdgeInsets.all(30)),
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }

  static Container yuktPasswordFormField({
    hintText,
    String? label,
    YuktLoginCubit? loginCubit,
    YuktRegisterCubit? registerCubit,
    onFieldSubmitted,
    String? Function(String?)? validator,
    onChanged,
    focusNode,
    required controller,
    required keyboardType,
    textInputAction,
  }) {
    return Container(
      height: 70,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: TextFormField(
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.montserrat(
          color: YuktColors.yuktWhite,
        ),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: YuktColors.yuktRed),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: YuktColors.yuktGrey),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: hintText,
          hintStyle: YuktTextStyles.yuktHintMontserrat(fs: 17.0),
          contentPadding: const EdgeInsets.all(30),
          suffixIcon: IconButton(
            onPressed: loginCubit != null
                ? loginCubit.changePasswordVisibility
                : registerCubit!.changePasswordVisibility,
            icon: Icon(
              loginCubit != null
                  ? loginCubit.passVisibility
                  : registerCubit!.passVisibility,
            ),
          ),
          focusColor: YuktColors.yuktRed,
        ),
        obscureText:
            loginCubit != null ? loginCubit.isShown : registerCubit!.isShown,
        validator: validator,
        onEditingComplete: () {},
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}
