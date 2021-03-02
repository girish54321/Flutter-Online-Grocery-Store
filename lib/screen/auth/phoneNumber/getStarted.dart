import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/screen/auth/phoneNumber/getStartedScreenUI.dart';
import 'package:OnlineGroceryStore/screen/auth/login/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';

class GetStartedScreen extends StatefulWidget {
  GetStartedScreen({Key key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<GetStartedScreen> {
  void goToLoginScreen() {
    Helper().goToPage(context, LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoardView(
      child: GetStartedScreenUI(goToLoginScreen: goToLoginScreen),
    );
  }
}
