import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/findProductScreen/findProductUI.dart';
import 'package:OnlineGroceryStore/screen/productByCategory/productByCategoryScreen.dart';
import 'package:OnlineGroceryStore/helper/helper.dart';

class FindProductScreen extends StatefulWidget {
  FindProductScreen({Key key}) : super(key: key);

  @override
  _FindProductScreenState createState() => _FindProductScreenState();
}

class _FindProductScreenState extends State<FindProductScreen> {
  TextEditingController searchTextController = TextEditingController();
  void goToProductList(bool search) {
    Helper().goToPage(
        context,
        ProductByCategoryScreen(
          serachText: null,
          search: search,
        ));
  }

  void onSearch(
    String searchText,
  ) {
    Helper().goToPage(
        context,
        ProductByCategoryScreen(
          serachText: searchText,
          search: true,
        ));
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FindProductUI(
        goToProductList: goToProductList,
        onSearch: onSearch,
        searchTextController: searchTextController);
  }
}
