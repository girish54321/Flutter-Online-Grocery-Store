import 'package:OnlineGroceryStore/screen/orderSuccess/orderSuccessScreenUi.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatefulWidget {
  OrderSuccessScreen({Key key}) : super(key: key);

  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return OrderSuccessScreenUi();
  }
}
