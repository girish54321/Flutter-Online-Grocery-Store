import 'package:OnlineGroceryStore/widget/appNetworkImage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:OnlineGroceryStore/widget/appIndicator.dart';

class ProductImage extends StatefulWidget {
  final List<String> images;
  final Function goToImageView;
  final double size;

  const ProductImage({Key key, this.images, this.goToImageView, this.size})
      : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Carousel(
              animationCurve: Curves.linear,
              autoplay: false,
              showIndicator: false,
              onImageChange: (int _currentImageIndex, int currentPage) {
                setState(() {
                  bannerIndex = currentPage;
                });
              },
              images: [
                ...widget.images.asMap().entries.map((MapEntry map) {
                  return InkWell(
                    onTap: () {
                      widget.goToImageView(widget.images);
                    },
                    child: Container(
                      height: widget.size,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: AppNetWorkIamge(
                          imageUrl: widget.images[map.key],
                          boxFit: BoxFit.contain),
                    ),
                  );
                }).toList(),
              ],
            )),
        Positioned(
          right: 12,
          bottom: 22,
          child: AppIndicator(
            index: bannerIndex,
            conut: 3,
          ),
        ),
      ],
    );
  }
}
