import 'package:OnlineGroceryStore/widget/appIcon.dart';
import 'package:OnlineGroceryStore/widget/appInputText.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/blurHeaderImage.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class SignUpUI extends StatelessWidget {
  final bool validEmail;
  final bool validPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController useraNameController;
  final Function changeVaildEmail;
  final Function changevalidPassword;
  final Function changevalidUserName;
  final bool validUserName;
  final GlobalKey<FormState> formKey;
  final Function signUp;
  final Function goToNumberScreen;

  const SignUpUI({
    Key key,
    @required this.validEmail,
    @required this.validPassword,
    @required this.emailController,
    @required this.passwordController,
    @required this.useraNameController,
    @required this.changeVaildEmail,
    @required this.changevalidPassword,
    @required this.changevalidUserName,
    @required this.validUserName,
    @required this.formKey,
    @required this.signUp,
    this.goToNumberScreen,
  }) : super(key: key);

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
                                    text: "Sign Up",
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  SmallText(
                                    text: "Enter your email and password",
                                  ),
                                  InputText(
                                      textEditingController:
                                          useraNameController,
                                      password: false,
                                      textInputType: TextInputType.name,
                                      hint: "User Name",
                                      onChnaged: (text) {
                                        final userNameRule = Rule(
                                          text,
                                          name: 'User Name',
                                          isRequired: true,
                                        );
                                        if (userNameRule.hasError) {
                                          changevalidUserName(false);
                                        } else {
                                          changevalidUserName(true);
                                        }
                                      },
                                      rightIcon: validUserName
                                          ? RightIcon()
                                          : WorngIcon(),
                                      validator: (password) {
                                        final userNameRule = Rule(
                                          password,
                                          name: 'User Name',
                                          isRequired: true,
                                        );
                                        if (userNameRule.hasError) {
                                          changevalidUserName(false);
                                          return userNameRule.error;
                                        } else {
                                          changevalidUserName(true);
                                          return null;
                                        }
                                      }),
                                  InputText(
                                      textEditingController: emailController,
                                      password: false,
                                      hint: "Email",
                                      textInputType: TextInputType.emailAddress,
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
                                  SmallText(
                                      text:
                                          "By continuing you agress to our Terms if Service and Privacy Policy.",
                                      colors: Colors.grey),
                                  SizedBox(
                                    height: 34,
                                  ),
                                  FadeInUp(
                                    duration: Duration(seconds: 1),
                                    child: AppButton(
                                        color: Theme.of(context).accentColor,
                                        function: () {
                                          signUp();
                                        },
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already have an account? ',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
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
