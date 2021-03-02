import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart' as DotsIndicator;

class AppIndicator extends StatelessWidget {
  final int conut;
  final int index;

  const AppIndicator({Key key, @required this.conut, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator.DotsIndicator(
      dotsCount: conut,
      position: index.toDouble(),
      decorator: DotsIndicator.DotsDecorator(
        size: const Size.square(6.0),
        spacing: EdgeInsets.only(right: 5),
        color: Colors.grey,
        activeSize: const Size(19.0, 6.0),
        activeColor: Theme.of(context).accentColor,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
