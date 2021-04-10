import 'package:OnlineGroceryStore/widget/orderPlacedDialog.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreenUi extends StatelessWidget {
  const OrderSuccessScreenUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrderPlacedDialog(),
    );
  }
}
