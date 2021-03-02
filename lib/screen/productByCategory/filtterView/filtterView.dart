import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FiltterView extends StatelessWidget {
  final Function closeBackDrop;
  const FiltterView({Key key, @required this.closeBackDrop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 14),
            child: AppTextP1(
              textAlign: TextAlign.start,
              text: "Filtters",
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 6),
          child: AppTextP1(
            textAlign: TextAlign.start,
            text: "Categories",
          ),
        ),
        CheckBoxView(
          title: "Eggs",
        ),
        CheckBoxView(
          title: "Noodles & Pasta",
        ),
        CheckBoxView(
          title: "Chips & Crisps",
        ),
        CheckBoxView(
          title: "Fast Food",
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 6),
          child: AppTextP1(
            textAlign: TextAlign.start,
            text: "Brand",
          ),
        ),
        CheckBoxView(
          title: "Individual Collection",
        ),
        CheckBoxView(
          title: "Cocola",
        ),
        CheckBoxView(
          title: "Ifad",
        ),
        CheckBoxView(
          title: "Kazi Farmas",
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ElasticIn(
            child: AppButton(
                color: Theme.of(context).accentColor,
                function: closeBackDrop,
                child: Center(
                  child: Text(
                    "Apple Filter",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

class CheckBoxView extends StatelessWidget {
  final String title;

  const CheckBoxView({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool value) {},
        ),
        Text(title),
      ],
    );
  }
}
