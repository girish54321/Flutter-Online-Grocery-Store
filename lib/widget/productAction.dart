import 'package:flutter/material.dart';
import 'package:floating_action_row/floating_action_row.dart';

class ProductAction extends StatelessWidget {
  final Function addFunction;
  final Function removeFunction;
  const ProductAction(
      {Key key, @required this.addFunction, @required this.removeFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: FloatingActionRow(
            elevation: 0,
            height: 46,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Theme.of(context).scaffoldBackgroundColor,
            children: <Widget>[
              FloatingActionRowButton(
                size: 55,
                icon: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                onTap: removeFunction,
              ),
              Container(
                width: 46,
                padding: EdgeInsets.only(top: 4, bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    "1",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              FloatingActionRowButton(
                size: 55,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                ),
                onTap: addFunction,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            "49.99",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }
}
