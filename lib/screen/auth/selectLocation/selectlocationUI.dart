import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/blurHeaderImage.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';

import 'package:geocoding/geocoding.dart';
import 'package:rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/appInputText.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';

class SelectLocastion extends StatelessWidget {
  final Function getTheUserLocation;
  final TextEditingController addressLine1Controller;
  final TextEditingController addressLine2Controller;
  final TextEditingController landMarkController;
  final Placemark placemark;
  final GlobalKey<FormState> formKey;
  final Function saveAddress;
  const SelectLocastion(
      {Key key,
      @required this.getTheUserLocation,
      @required this.addressLine1Controller,
      @required this.addressLine2Controller,
      @required this.placemark,
      @required this.landMarkController,
      @required this.formKey,
      @required this.saveAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyBoardView(
        child: Stack(
          children: [
            BlurHeaderImage(),
            ListView(
              children: [
                Stack(
                  children: [
                    SlideInLeft(
                      duration: Duration(milliseconds: 600),
                      child: GoBackButton(
                        marginTop: 12,
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
                            height: 160,
                            margin: EdgeInsets.only(top: 98, bottom: 24),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/image/map_pin.png'),
                                    fit: BoxFit.fitHeight)),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 46),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppTextH2(
                                    fontWeight: FontWeight.bold,
                                    text: "Select Your Location",
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  SmallText(
                                    textAlign: TextAlign.center,
                                    colors: Colors.grey,
                                    text:
                                        "Switch on your location to stay in tune with \nwhat's happening in your area",
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  placemark != null
                                      ? InputText(
                                          textEditingController:
                                              addressLine1Controller,
                                          password: false,
                                          hint: "Room Number / Apartment",
                                          onChnaged: (text) {
                                            final addressLine1Rule = Rule(
                                              text,
                                              name: 'Room Number / Apartment',
                                              isRequired: true,
                                            );
                                            if (addressLine1Rule.hasError) {
                                              print("ERROR");
                                              // changeVaildEmail(false);
                                            } else {
                                              print("NO ERROR");
                                              // changeVaildEmail(true);
                                            }
                                          },
                                          validator: (text) {
                                            final addressLine1Rule = Rule(
                                              text,
                                              name: 'Room Number / Apartment',
                                              isRequired: true,
                                            );
                                            if (addressLine1Rule.hasError) {
                                              return addressLine1Rule.error;
                                            } else {
                                              return null;
                                            }
                                          })
                                      : Text(""),
                                  placemark != null
                                      ? InputText(
                                          textEditingController:
                                              addressLine2Controller,
                                          password: false,
                                          hint: "Address Line 2",
                                          onChnaged: (text) {
                                            final addressLine2Rule = Rule(
                                              text,
                                              name: 'Address Line 2',
                                              isRequired: true,
                                            );
                                            if (addressLine2Rule.hasError) {
                                              // changevalidPassword(false);
                                            } else {
                                              // changevalidPassword(true);
                                            }
                                          },
                                          validator: (password) {
                                            final addressLine2Rule = Rule(
                                              password,
                                              name: 'Address Line 2',
                                              isRequired: true,
                                            );
                                            if (addressLine2Rule.hasError) {
                                              return addressLine2Rule.error;
                                            } else {
                                              return null;
                                            }
                                          })
                                      : Text(""),
                                  placemark != null
                                      ? InputText(
                                          textEditingController:
                                              landMarkController,
                                          password: false,
                                          hint: "landMark (optional)",
                                        )
                                      : Text(""),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  FadeInUp(
                                    duration: Duration(seconds: 1),
                                    child: AppButton(
                                        color: Theme.of(context).accentColor,
                                        function: () {
                                          if (placemark != null) {
                                            saveAddress();
                                          }
                                          getTheUserLocation();
                                        },
                                        child: Center(
                                          child: Text(
                                            placemark != null
                                                ? "Save And Continue"
                                                : "Share Your Location",
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
