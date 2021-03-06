import 'package:OnlineGroceryStore/widget/appIcon.dart';
import 'package:OnlineGroceryStore/widget/appInputText.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/blurHeaderImage.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class LoginScreenUI extends StatelessWidget {
  final bool validEmail;
  final bool validPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function changeVaildEmail;
  final Function changevalidPassword;
  final Function changeRemamberme;
  final bool remamberme;
  final GlobalKey<FormState> formKey;
  final Function loginUser;
  final Function createAccount;

  const LoginScreenUI(
      {Key key,
      @required this.emailController,
      @required this.passwordController,
      @required this.validEmail,
      @required this.validPassword,
      @required this.changeVaildEmail,
      @required this.changevalidPassword,
      @required this.changeRemamberme,
      @required this.remamberme,
      @required this.formKey,
      @required this.loginUser,
      @required this.createAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Form(
                  key: formKey,
                  child: Stack(
                    children: [
                      BlurHeaderImage(),
                      SlideInLeft(
                        duration: Duration(milliseconds: 600),
                        child: GoBackButton(
                          function: () {
                            Helper().goBack(context);
                          },
                        ),
                      ),
                      Column(
                        children: [
                          FadeInUp(
                            duration: Duration(seconds: 1),
                            child: Container(
                              height: 55,
                              margin: EdgeInsets.only(top: 64, bottom: 64),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/image/icon_color.png'),
                                      fit: BoxFit.fitHeight)),
                            ),
                          ),
                          FadeInUp(
                            duration: Duration(seconds: 1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 46),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextH2(
                                    fontWeight: FontWeight.bold,
                                    text: "LogIn",
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  SmallText(
                                    text: "Enter your email and password",
                                  ),
                                  InputText(
                                      textInputType: TextInputType.emailAddress,
                                      textEditingController: emailController,
                                      password: false,
                                      hint: "Email",
                                      onChnaged: (text) {
                                        final emailRule = Rule(text,
                                            name: 'Email',
                                            isRequired: true,
                                            isEmail: true);
                                        if (emailRule.hasError) {
                                          changeVaildEmail(false);
                                        } else {
                                          changeVaildEmail(true);
                                        }
                                      },
                                      rightIcon: validEmail
                                          ? RightIcon()
                                          : WorngIcon(),
                                      validator: (password) {
                                        final passWordRule = Rule(password,
                                            name: 'Email',
                                            isRequired: true,
                                            isEmail: true);
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  InputText(
                                      textEditingController: passwordController,
                                      password: true,
                                      hint: "Password",
                                      onChnaged: (text) {
                                        final emailRule = Rule(text,
                                            name: 'Password',
                                            isRequired: true,
                                            minLength: 6);
                                        if (emailRule.hasError) {
                                          changevalidPassword(false);
                                        } else {
                                          changevalidPassword(true);
                                        }
                                      },
                                      rightIcon: validPassword
                                          ? RightIcon()
                                          : WorngIcon(),
                                      validator: (password) {
                                        final passWordRule = Rule(password,
                                            name: 'Password',
                                            isRequired: true,
                                            minLength: 6);
                                        if (passWordRule.hasError) {
                                          return passWordRule.error;
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          SizedBox(
                                              height: 24.0,
                                              width: 24.0,
                                              child: Checkbox(
                                                value: remamberme,
                                                onChanged: (bool value) {
                                                  changeRemamberme(value);
                                                },
                                              )),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Remamber me',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            // Helper().goToPage(
                                            //     context, ForgotPasswordScreen());
                                          },
                                          child: Text(
                                            'Forgot Password',
                                            style: TextStyle(fontSize: 16.0),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 34,
                                  ),
                                  FadeInUp(
                                    duration: Duration(seconds: 1),
                                    child: AppButton(
                                        color: Theme.of(context).accentColor,
                                        function: () {
                                          loginUser();
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
                                  SizedBox(
                                    height: 34,
                                  ),
                                  FadeInUp(
                                    duration: Duration(seconds: 1),
                                    child: GestureDetector(
                                      onTap: () {
                                        createAccount();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Dont have an account? ',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Text(
                                            'Singup',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 34,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
