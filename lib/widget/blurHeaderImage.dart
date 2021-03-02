import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BlurHeaderImage extends StatelessWidget {
  const BlurHeaderImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 14,
      blurColor: Colors.white,
      child: Container(
          width: double.infinity,
          child: Image.asset(
            "assets/image/header_image.png",
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
