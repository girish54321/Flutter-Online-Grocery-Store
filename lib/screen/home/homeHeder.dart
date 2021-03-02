import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';

class HomeHeaderImage extends StatelessWidget {
  const HomeHeaderImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 44,
        margin: EdgeInsets.only(top: 12, bottom: 8),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/icon_color.png'),
                fit: BoxFit.fitHeight)),
      ),
    );
  }
}

class UserAddressView extends StatelessWidget {
  final String address;
  const UserAddressView({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          EvaIcons.pin,
          color: Colors.grey,
          size: 28,
        ),
        AppTextP1(
          textAlign: TextAlign.center,
          text: address,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
