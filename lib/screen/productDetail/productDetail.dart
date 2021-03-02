import 'package:OnlineGroceryStore/screen/productDetail/widget/productImage.dart';
import 'package:OnlineGroceryStore/screen/productDetail/widget/productSelaction.dart';
import 'package:OnlineGroceryStore/widget/seeAllTitle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_transition/page_transition.dart';
import 'package:OnlineGroceryStore/screen/productDetail/productViewImages.dart';

class ProductDetail extends StatefulWidget {
  // final Product product;

  const ProductDetail({
    Key key,
  }) : super(key: key);
  @override
  _ProductDetiasState createState() => _ProductDetiasState();
}

class _ProductDetiasState extends State<ProductDetail> {
  int selectedSize = 0;
  List<String> images = [
    "https://images.unsplash.com/photo-1593359797688-c51a69ecc2d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDN8fGFwcGxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=60",
    "https://images.unsplash.com/photo-1580062760649-1250019c0623?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzZ8fGFwcGxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=60",
    "https://images.unsplash.com/photo-1567445517997-20a969632aad?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDh8fGFwcGxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=60"
  ];

  goToImageView(List<String> images) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: ProductImageView(
              images: images,
            )));
  }

  changeSelectedSize(index) {
    setState(() {
      selectedSize = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: size.height * 0.4,
            floating: false,
            pinned: false,
            leading: IconButton(
              icon: Icon(
                EvaIcons.arrowIosBack,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                ProductImage(
                    size: size.height * 0.4,
                    images: images,
                    goToImageView: goToImageView),
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              child: Container(
                margin:
                    EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "widget.product.name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "1Kg",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(child: ProductSelction()),
          ),
          SliverToBoxAdapter(
              child: FadeInUp(
            child: SeeAppTitle(
              title: "Details",
              function: () {},
            ),
          )),
          SliverToBoxAdapter(
              child: FadeInUp(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "widget.product.description",
                style: TextStyle(
                  height: 1.8,
                  fontSize: 18,
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text(
              "Read More",
              style: TextStyle(
                height: 1.8,
                fontSize: 18,
                color: Color(0xff00c569),
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: FadeInUp(
            child: SeeAppTitle(
              title: "Reviews",
              function: () {},
            ),
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: FadeInUp(
                    child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:
                              "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto/5e4787fc-a474-4842-9f67-489d28a9cb1e/sportswear-t-shirt-CLFcd1.jpg",
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                                  radius: 27, backgroundImage: imageProvider),
                        ),
                        title: Text(
                          "Samuel Smith",
                          style: TextStyle(
                            height: 1.8,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                          ),
                        ),
                        subtitle: Text(
                          "Wonderful jean, perfect gift for my girl for our anniversary!",
                          style: TextStyle(
                            height: 1.7,
                            color: Color(0xff000000),
                          ),
                        )),
                  ),
                );
              },
              childCount: 4,
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 77.00,
          )),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 32, right: 4),
        child: FadeInUp(
          duration: Duration(seconds: 1),
          child: AppButton(
              color: Theme.of(context).accentColor,
              function: () {
                // Helper()
                //     .goToPage(context, GetStartedScreen());
              },
              child: Center(
                child: Text(
                  "Add To Basket",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }
}
