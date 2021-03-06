import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/listItems.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              floating: false,
              pinned: true,
              title: Text("My Cart"),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return CartListItem();
              }, childCount: 12),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 78,
              ),
            )
          ]),
    );
  }
}
