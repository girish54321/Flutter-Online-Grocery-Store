import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SeeAppTitle extends StatelessWidget {
  final String title;
  final Function function;
  const SeeAppTitle({Key key, @required this.title, @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 26, left: 16, right: 16, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          InkWell(
            onTap: function,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "See all",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 17, color: Theme.of(context).accentColor),
                  ),
                ),
                Icon(EvaIcons.arrowIosForward,
                    color: Theme.of(context).accentColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
