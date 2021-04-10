import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../helper/helper.dart';
import 'appText.dart';
import 'buttons.dart';

class OrderPlacedDialog extends StatelessWidget {
  const OrderPlacedDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 300,
            child: Lottie.asset(
              'assets/lottie/check.json',
              repeat: false,
            ),
          ),
          Column(
            children: [
              AppTextH2(
                text: "Your Order has been\naccepted",
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              AppTextP1(
                  text: "1 product has been added to cart",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: FadeInUp(
              duration: Duration(microseconds: 400),
              child: Column(
                children: [
                  AppButton(
                      color: Theme.of(context).accentColor,
                      function: () {
                        // loginUser();
                      },
                      child: Center(
                        child: Text(
                          "Track Order",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 18,
                  ),
                  AppButton(
                      color: Colors.white,
                      function: () {
                        Helper().goBack(context);
                      },
                      child: Center(
                        child: Text(
                          "Back to home",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
