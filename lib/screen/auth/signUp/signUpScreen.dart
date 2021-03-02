import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/screen/auth/numberAuth/enterNumber/enterNumberScreen.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/auth/signUp/signUpUI.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final useraNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validEmail = false, validPassword = false, validUserName = false;

  void goBack(context) {
    Helper().goBack(context);
  }

  void changeVaildEmail(bool value) {
    setState(() {
      validEmail = value;
    });
  }

  void changevalidPassword(bool value) {
    setState(() {
      validPassword = value;
    });
  }

  void changevalidUserName(bool value) {
    setState(() {
      validUserName = value;
    });
  }

  void signUp() {
    goToNumberScreen();
    if (_formKey.currentState.validate()) {
      goToNumberScreen();
    } else {
      Helper().vibratPhone();
    }
  }

  void goToNumberScreen() {
    Helper().goToPage(context, EnterPhoneNumber());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    useraNameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoardView(
      child: SignUpUI(
        emailController: emailController,
        passwordController: passwordController,
        validEmail: validEmail,
        validPassword: validPassword,
        changeVaildEmail: changeVaildEmail,
        changevalidPassword: changevalidPassword,
        formKey: _formKey,
        goToNumberScreen: goToNumberScreen,
        signUp: signUp,
        changevalidUserName: changevalidUserName,
        useraNameController: useraNameController,
        validUserName: validUserName,
      ),
    );
  }
}
