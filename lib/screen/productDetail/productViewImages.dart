import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProductImageView extends StatefulWidget {
  final List<String> images;
  ProductImageView({Key key, this.images}) : super(key: key);

  @override
  _ProductImageViewState createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  PageController pageController;
  int selectedIndex = 0;
  bool open = true;

  changeIndex(index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              ...widget.images.asMap().entries.map((MapEntry map) {
                return InteractiveViewer(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        open = !open;
                      });
                    },
                    child: CachedNetworkImage(
                      imageUrl: widget.images[map.key],
                      imageBuilder: (context, imageProvider) => Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: imageProvider,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
          IconButton(
            icon: Icon(
              EvaIcons.arrowIosBack,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )),
      bottomSheet: AnimatedContainer(
        duration: new Duration(seconds: 2),
        height: open ? 90 : 1,
        width: double.infinity,
        color: open ? Colors.transparent : Colors.black,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                changeIndex(index);
              },
              child: Container(
                margin: EdgeInsets.only(left: 14, bottom: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: selectedIndex == index
                          ? Theme.of(context).accentColor
                          : Colors.transparent),
                  borderRadius: BorderRadius.circular(4.00),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  imageBuilder: (context, imageProvider) => Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(4.00),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
