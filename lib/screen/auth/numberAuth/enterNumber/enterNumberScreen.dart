import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/screen/auth/numberAuth/otpScreen/otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/auth/numberAuth/enterNumber/enterNumberUI.dart';

class EnterPhoneNumber extends StatefulWidget {
  EnterPhoneNumber({Key key}) : super(key: key);

  @override
  _EnterPhoneNumberState createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  TextEditingController numberTextEditingController;
  final _formKey = GlobalKey<FormState>();
  FocusNode mobileNumFocusNode;

  void goToOtpScreen() {
    Helper().goToPage(context, OtpScreen());
  }

  void sendOtp() {
    if (_formKey.currentState.validate()) {
      Helper().dismissKeyBoard(context);
      goToOtpScreen();
    } else {
      Helper().vibratPhone();
    }
  }

  @override
  void initState() {
    mobileNumFocusNode = FocusNode();
    mobileNumFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    numberTextEditingController.dispose();
    mobileNumFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EnterNumberUI(
      formKey: _formKey,
      numberTextEditingController: numberTextEditingController,
      sendOtp: sendOtp,
      mobileNumFocusNode: mobileNumFocusNode,
    );
  }
}
