import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/productAction.dart';

class ProductSelction extends StatefulWidget {
  const ProductSelction({
    Key key,
  }) : super(key: key);
  @override
  _ProductSelctionState createState() => _ProductSelctionState();
}

class _ProductSelctionState extends State<ProductSelction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4,
        ),
        ProductAction(
          addFunction: () {},
          removeFunction: () {},
        ),
        SizedBox(
          height: 8,
        ),
        Divider(),
      ],
    );
  }
}
