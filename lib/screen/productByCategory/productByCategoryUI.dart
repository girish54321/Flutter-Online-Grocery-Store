import 'package:OnlineGroceryStore/screen/productByCategory/filtterView/filtterView.dart';
import 'package:OnlineGroceryStore/widget/listItems.dart';
import 'package:OnlineGroceryStore/widget/searchBox.dart';
import 'package:animate_do/animate_do.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:backdrop_modal_route/backdrop_modal_route.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class ProductByCategoryUI extends StatelessWidget {
  final bool search;
  final TextEditingController searchTextController;

  const ProductByCategoryUI(
      {Key key, @required this.search, @required this.searchTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: search
            ? Container(
                child: SearchBox(
                  textEditingController: searchTextController,
                  function: () {},
                  radius: 8,
                  height: 45.0,
                ),
              )
            : Text("Products"),
        leading: IconButton(
          icon: Icon(EvaIcons.arrowIosBack),
          onPressed: () {
            Helper().goBack(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(FluentIcons.filter_24_regular),
            onPressed: () async {
              await Navigator.push(
                context,
                BackdropModalRoute<void>(
                  overlayContentBuilder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FiltterView(
                        closeBackDrop: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                childAspectRatio: (itemWidth / 280),
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SlideInRight(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 16,
                      ),
                      child: ProductItem(
                        name: "Name",
                        imageUrl:
                            "https://5.imimg.com/data5/IN/DK/GP/SELLER-88087163/pepsi-2-liter-bottle-500x500.jpg",
                        function: () {
                          // goToProductList();
                        },
                        price: "null",
                      ),
                    ),
                  );
                },
                childCount: 9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
