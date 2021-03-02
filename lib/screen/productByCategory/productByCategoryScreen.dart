import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/productByCategory/productByCategoryUI.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final bool search;
  final String serachText;
  ProductByCategoryScreen(
      {Key key, @required this.search, @required this.serachText})
      : super(key: key);

  @override
  _ProductByCategoryScreenState createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    if (widget.search == true) {
      String text = widget.serachText;
      print(widget.serachText);
      searchTextController.text = text;
    }
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProductByCategoryUI(
      searchTextController: searchTextController,
      search: widget.search,
    );
  }
}
