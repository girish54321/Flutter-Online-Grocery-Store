import 'package:OnlineGroceryStore/widget/appNetworkImage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/widget/appIndicator.dart';

class BannersItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  const BannersItem({Key key, @required this.imageUrl, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: AppNetWorkIamge(
        imageUrl: imageUrl,
        radius: 8,
      ),
    );
  }
}

class AppBanner extends StatefulWidget {
  final bool bigBanner;

  const AppBanner({
    Key key,
    @required this.bigBanner,
  }) : super(key: key);

  @override
  _AppBannerState createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  int bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1557844352-761f2565b576?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"',
      'https://images.unsplash.com/photo-1425543103986-22abb7d7e8d2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      'https://images.unsplash.com/photo-1540857998731-452f223b4413?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
    ];
    return Stack(
      children: [
        Container(
          height: widget.bigBanner ? 300 : 180,
          width: double.infinity,
          // child: Carousel(
          //   autoplayDuration: Duration(seconds: 10),
          //   animationCurve: Curves.easeIn,
          //   onImageChange: (int _currentImageIndex, int currentPage) {
          //     setState(() {
          //       bannerIndex = currentPage;
          //     });
          //   },
          //   images: [
          //     BannersItem(
          //       imageUrl:
          //           "https://images.unsplash.com/photo-1557844352-761f2565b576?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
          //       text: "",
          //     ),
          //     BannersItem(
          //       imageUrl:
          //           "https://images.unsplash.com/photo-1425543103986-22abb7d7e8d2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
          //       text: "",
          //     ),
          //     BannersItem(
          //       imageUrl:
          //           "https://images.unsplash.com/photo-1540857998731-452f223b4413?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
          //       text: "",
          //     ),
          //   ],
          //   showIndicator: false,
          // ),
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  bannerIndex = index;
                });
              },
              autoPlay: true,
              viewportFraction: 1.0,
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: imgList.map(
              (url) {
                return BannersItem(
                  imageUrl: url,
                  text: "",
                );
              },
            ).toList(),
          ),
        ),
        Positioned(
          left: 1,
          right: 1,
          bottom: 10,
          child: AppIndicator(
            index: bannerIndex,
            conut: 3,
          ),
        ),
      ],
    );
  }
}
