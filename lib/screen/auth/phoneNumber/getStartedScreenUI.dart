import 'dart:ui';

import 'package:OnlineGroceryStore/screen/auth/phoneNumber/socialMediaButton.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class GetStartedScreenUI extends StatelessWidget {
  final Function goToLoginScreen;

  const GetStartedScreenUI({Key key, this.goToLoginScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/image/header_image.png",
                  fit: BoxFit.fitWidth,
                )),
            Positioned(
              bottom: 1,
              right: 1,
              left: 1,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 22),
                          child: Column(children: [
                            SizedBox(
                              height: 18,
                            ),
                            FadeInUp(
                                duration: Duration(seconds: 1),
                                child: AppTextH2(
                                  textAlign: TextAlign.start,
                                  text: "Get your groceries with nectar",
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              height: 14,
                            ),
                            // InternationalPhoneInput(
                            //     decoration: InputDecoration.collapsed(
                            //         hintText: '(416) 123-4567'),
                            //     // onPhoneNumberChange: onPhoneNumberChange,
                            //     // initialPhoneNumber: phoneNumber,
                            //     // initialSelection: phoneIsoCode,
                            //     enabledCountries: ['+233', '+1'],
                            //     showCountryCodes: false),
                            // FadeInUp(
                            //   duration: Duration(seconds: 1),
                            //   child: Container(
                            //     color: Colors.white,
                            //     child: IntlPhoneField(
                            //       controller: phoneTextEditingController,
                            //       decoration: InputDecoration(
                            //         fillColor: Colors.white,
                            //         labelText: 'Phone Number',
                            //         border: OutlineInputBorder(
                            //           borderSide: BorderSide(),
                            //         ),
                            //       ),
                            //       initialCountryCode: 'IN',
                            //       onChanged: (phone) {
                            //         print(phone.completeNumber);
                            //       },
                            //     ),
                            //   ),
                            // ),
                            FadeInUp(
                              duration: Duration(seconds: 1),
                              child: AppButton(
                                  color: Theme.of(context).accentColor,
                                  function: () {
                                    goToLoginScreen();
                                  },
                                  child: Center(
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 18.0),
                              child: FadeInUp(
                                duration: Duration(seconds: 1),
                                child: SmallText(
                                  text: "Or connect Social Media",
                                ),
                              ),
                            ),

                            SocialMediaButton(
                                function: () {
                                  goToLoginScreen();
                                },
                                text: "Continue With Google",
                                icon:
                                    Icon(EvaIcons.google, color: Colors.white),
                                color: Color(0xFF5383ec)),
                            SizedBox(
                              height: 20,
                            ),
                            SocialMediaButton(
                                function: () {
                                  goToLoginScreen();
                                },
                                text: "Continue With Facebook",
                                icon: Icon(EvaIcons.facebook,
                                    color: Colors.white),
                                color: Color(0xFF4a66ac)),
                            SizedBox(
                              height: 34,
                            ),
                          ]))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
