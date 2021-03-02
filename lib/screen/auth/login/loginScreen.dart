import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/auth/login/loginUI.dart';
import 'package:OnlineGroceryStore/screen/auth/signUp/signUpScreen.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validEmail = false, validPassword = false, remamberme = true;

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

  void changeRemamberme(bool value) {
    setState(() {
      remamberme = value;
    });
  }

  void loginUser() {
    if (_formKey.currentState.validate()) {
      Helper().dismissKeyBoard(context);
    } else {
      Helper().vibratPhone();
    }
  }

  void createAccount() {
    Helper().dismissKeyBoard(context);
    Helper().goToPage(context, SignUpScreen());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoardView(
      child: LoginScreenUI(
          emailController: emailController,
          passwordController: passwordController,
          validEmail: validEmail,
          validPassword: validPassword,
          changeVaildEmail: changeVaildEmail,
          changevalidPassword: changevalidPassword,
          changeRemamberme: changeRemamberme,
          remamberme: remamberme,
          formKey: _formKey,
          createAccount: createAccount,
          loginUser: loginUser),
    );
  }
}
