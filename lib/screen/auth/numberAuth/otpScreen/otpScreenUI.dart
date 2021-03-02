import 'package:OnlineGroceryStore/widget/blurHeaderImage.dart';
import 'package:flutter/material.dart';

import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:animate_do/animate_do.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class OtpScreeUI extends StatelessWidget {
  final Widget onlySelectedBorderPinPut;
  final Function goToLocationScreen;

  const OtpScreeUI(
      {Key key,
      @required this.onlySelectedBorderPinPut,
      @required this.goToLocationScreen})
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
              child: DismissKeyBoardView(
                child: Stack(
                  children: [
                    BlurHeaderImage(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 14),
                          height: 300.00,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeInUp(
                                  duration: Duration(milliseconds: 600),
                                  child: AppTextH1(
                                    textAlign: TextAlign.start,
                                    text: "Enter your OTP",
                                  )),
                              FadeInUp(
                                duration: Duration(milliseconds: 600),
                                child: SmallText(
                                  text: "Mobile Number",
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              FadeInUp(
                                duration: Duration(milliseconds: 600),
                                child: Container(
                                  child: onlySelectedBorderPinPut,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: ElasticIn(
        duration: Duration(seconds: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 34.0,
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'ReSend OTP',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                goToLocationScreen();
              },
              child: Icon(EvaIcons.arrowIosForward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
