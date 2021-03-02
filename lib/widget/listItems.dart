import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/appNetworkImage.dart';
import 'package:OnlineGroceryStore/widget/appText.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floating_action_row/floating_action_row.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final Function function;

  const ProductItem(
      {Key key,
      @required this.function,
      @required this.name,
      @required this.price,
      @required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 220,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.all(
          14,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  child: AppNetWorkIamge(
                    radius: 18.0,
                    imageUrl: imageUrl,
                    boxFit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                AppTextP1(
                  textAlign: TextAlign.start,
                  text: "Name",
                ),
                Text(
                  "Name",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextP1(
                  textAlign: TextAlign.start,
                  text: "Name",
                ),
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Icon(EvaIcons.plus, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductCategorItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Function function;
  const ProductCategorItem(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey)),
      child: InkWell(
        onTap: function,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: AppNetWorkIamge(
                radius: 8,
                boxFit: BoxFit.contain,
                imageUrl: imageUrl,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              alignment: Alignment.center,
              child: AppTextP1(
                textAlign: TextAlign.center,
                text: "Name ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceriesItem extends StatelessWidget {
  final Function function;
  const GroceriesItem({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        // height: 100,
        width: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey)),
        margin: EdgeInsets.only(
          left: 16,
        ),
        padding: EdgeInsets.all(
          16,
        ),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 60,
              child: AppNetWorkIamge(
                boxFit: BoxFit.contain,
                radius: 18.0,
                imageUrl:
                    "https://5.imimg.com/data5/YY/EN/MY-8155364/fresh-apple-500x500.jpg",
              ),
            ),
            SizedBox(
              width: 12,
            ),
            AppTextP1(
              textAlign: TextAlign.start,
              text: "Name",
            ),
          ],
        ),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Container(
          margin: const EdgeInsets.only(top: 8, left: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 14),
                    height: 90,
                    width: 90,
                    child: AppNetWorkIamge(
                      radius: 8,
                      imageUrl:
                          "https://cdn-prod.medicalnewstoday.com/content/images/articles/273/273031/tomatoes-close-up.jpg",
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: "Some Name",
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "1Kg",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                EvaIcons.close,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionRow(
                              elevation: 0,
                              height: 46,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14.0)),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FloatingActionRowButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                Container(
                                  width: 46,
                                  padding: EdgeInsets.only(top: 4, bottom: 4),
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
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: EdgeInsets.only(top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14.0)),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FloatingActionRowButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 14),
                              child: Text(
                                "49.99",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
