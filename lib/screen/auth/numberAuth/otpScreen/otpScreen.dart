import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/screen/auth/numberAuth/otpScreen/otpScreenUI.dart';
import 'package:OnlineGroceryStore/screen/auth/selectLocation/selectLocationScreen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode otpFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void goToLocationScreen() {
    if (_formKey.currentState.validate()) {
      Helper().dismissKeyBoard(context);
      Helper().goToPage(context, SelectLocation());
    } else {
      Helper().vibratPhone();
    }
  }

  Widget onlySelectedBorderPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
    );
    return Form(
      key: _formKey,
      child: GestureDetector(
        onLongPress: () {},
        child: PinPut(
          validator: (s) {
            if (s.contains('12345')) {
              return null;
            } else {
              return 'Invalid OTP Code';
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          withCursor: true,
          fieldsCount: 5,
          fieldsAlignment: MainAxisAlignment.spaceAround,
          textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
          eachFieldMargin: EdgeInsets.all(0),
          eachFieldWidth: 51.0,
          eachFieldHeight: 51.0,
          // onSubmit: (String pin) => _showSnackBar(pin),
          focusNode: otpFocusNode,
          controller: _pinPutController,
          submittedFieldDecoration: pinPutDecoration,
          selectedFieldDecoration: pinPutDecoration.copyWith(
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
          ),
          followingFieldDecoration: pinPutDecoration,
          pinAnimationType: PinAnimationType.scale,
        ),
      ),
    );
  }

  @override
  void initState() {
    otpFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OtpScreeUI(
      goToLocationScreen: goToLocationScreen,
      onlySelectedBorderPinPut: onlySelectedBorderPinPut(),
    );
  }
}
