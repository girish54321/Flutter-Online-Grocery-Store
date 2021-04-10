import 'package:OnlineGroceryStore/screen/profileScreen/profileScreen.dart';
import 'package:OnlineGroceryStore/screen/profileScreen/profileScreenUi.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/home/home.dart';
import 'package:OnlineGroceryStore/screen/findProductScreen/findProductScreen.dart';
import 'package:OnlineGroceryStore/screen/cartScreen/cartScreen.dart';

class HomeMain extends StatefulWidget {
  HomeMain({Key key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  PageController pageController;
  int pageIndex = 0;

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

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Home(),
          FindProductScreen(),
          CartScreen(),
          MyPage(),
          ProfileScreenUi(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 28.0,
        selectedColor: Theme.of(context).accentColor,
        strokeColor: Theme.of(context).accentColor,
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          CustomNavigationBarItem(
              icon: Icon(FluentIcons.building_shop_24_regular),
              title: Text("Home")),
          CustomNavigationBarItem(
              icon: Icon(FluentIcons.clipboard_search_24_regular),
              title: Text("Search")),
          CustomNavigationBarItem(
              icon: Icon(FluentIcons.cart_24_regular), title: Text("Cart")),
          CustomNavigationBarItem(
              icon: Icon(FluentIcons.heart_24_regular), title: Text("Heart")),
          CustomNavigationBarItem(
              icon: Icon(FluentIcons.person_24_regular), title: Text("Person")),
        ],
        currentIndex: pageIndex,
        onTap: onTap,
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Hi")),
    );
  }
}
