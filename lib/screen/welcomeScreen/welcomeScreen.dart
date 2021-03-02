import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/screen/auth/phoneNumber/getStarted.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/welcome.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 1,
                right: 1,
                left: 1,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 22),
                          child: Column(children: [
                            FadeInUp(
                              duration: Duration(seconds: 1),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/image/icon.png'),
                                        fit: BoxFit.fitHeight)),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            FadeInUp(
                                duration: Duration(seconds: 1),
                                child: AppTextH1(
                                  textAlign: TextAlign.center,
                                  text: "Welcome\nto our Store",
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 14,
                            ),
                            FadeInUp(
                              duration: Duration(seconds: 1),
                              child: SmallText(
                                  text:
                                      "Get Your groceries in as fast as one hour",
                                  colors: Colors.grey),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            FadeInUp(
                              duration: Duration(seconds: 1),
                              child: AppButton(
                                  color: Theme.of(context).accentColor,
                                  function: () {
                                    Helper()
                                        .goToPage(context, GetStartedScreen());
                                  },
                                  child: Center(
                                    child: Text(
                                      "Get Stated",
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
                          ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
