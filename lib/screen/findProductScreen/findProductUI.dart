import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:OnlineGroceryStore/widget/searchBox.dart';
import 'package:OnlineGroceryStore/widget/listItems.dart';

class FindProductUI extends StatelessWidget {
  final Function goToProductList;
  final Function onSearch;
  final TextEditingController searchTextController;

  const FindProductUI({
    Key key,
    this.goToProductList,
    this.onSearch,
    @required this.searchTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Find Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: FadeInUp(
              duration: Duration(seconds: 1),
              child: Container(
                child: SearchBox(
                  textEditingController: searchTextController,
                  function: onSearch,
                  radius: 8,
                  height: 45.0,
                ),
              ),
            )),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                childAspectRatio: (itemWidth / 200),
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SlideInRight(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 14,
                      ),
                      child: ProductCategorItem(
                        name: "Name",
                        imageUrl:
                            "https://png.pngtree.com/png-clipart/20190516/original/pngtree-healthy-food-png-image_3776802.jpg",
                        function: () {
                          goToProductList(false);
                        },
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
