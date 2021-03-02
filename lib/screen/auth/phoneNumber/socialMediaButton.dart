import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color color;
  final Function function;
  const SocialMediaButton(
      {Key key,
      @required this.text,
      @required this.icon,
      @required this.color,
      @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(seconds: 1),
      child: AppButton(
        color: color,
        function: function,
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Center(
                  child: icon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
