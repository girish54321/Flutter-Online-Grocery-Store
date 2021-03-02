import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/blurHeaderImage.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';
import 'package:rules/rules.dart';

class EnterNumberUI extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController numberTextEditingController;
  final Function sendOtp;
  final FocusNode mobileNumFocusNode;

  const EnterNumberUI(
      {Key key,
      @required this.formKey,
      @required this.sendOtp,
      @required this.numberTextEditingController,
      @required this.mobileNumFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DismissKeyBoardView(
          child: Container(
            child: Stack(
              children: [
                BlurHeaderImage(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideInLeft(
                      duration: Duration(milliseconds: 600),
                      child: GoBackButton(
                        function: () {
                          Helper().goBack(context);
                        },
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                      child: FadeInUp(
                          duration: Duration(milliseconds: 600),
                          child: AppTextH1(
                            textAlign: TextAlign.start,
                            text: "Enter your mobile number",
                          )),
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22),
                        child: SmallText(
                          text: "Mobile Number",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: Form(
                        key: formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 22),
                          child: IntlPhoneField(
                              focusNode: mobileNumFocusNode,
                              controller: numberTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                labelText: 'Mobile Number',
                              ),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                              validator: (number) {
                                final passWordRule = Rule(
                                  number,
                                  name: 'Mobile Number',
                                  isRequired: true,
                                  isNumeric: true,
                                  isPhone: true,
                                );
                                if (passWordRule.hasError) {
                                  return passWordRule.error;
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: ElasticIn(
          duration: Duration(seconds: 1),
          child: FloatingActionButton(
            onPressed: () {
              sendOtp();
            },
            child: Icon(EvaIcons.arrowIosForward, color: Colors.white),
          ),
        ));
  }
}
