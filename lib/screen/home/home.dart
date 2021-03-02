import 'package:OnlineGroceryStore/widget/bannersItems.dart';
import 'package:OnlineGroceryStore/widget/dismissKeyBoardView.dart';
import 'package:OnlineGroceryStore/widget/searchBox.dart';
import 'package:OnlineGroceryStore/widget/seeAllTitle.dart';
import 'package:OnlineGroceryStore/widget/listItems.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:OnlineGroceryStore/screen/home/homeHeder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:OnlineGroceryStore/widget/appDialogs.dart';
import 'package:OnlineGroceryStore/screen/productDetail/productDetail.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String displayAddress = "";

  void getTheUserLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await AppDialogs.yesAbortDialog(context, 'Location Error!',
            "Location Disabled", "Location services are disabled.", true);
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        await AppDialogs.yesAbortDialog(
            context,
            'Location Error!',
            "Permission Denied",
            'Location permissions are permantly denied, we cannot request permissions.',
            true);
        return Future.error(
            'Location permissions are permantly denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          await AppDialogs.yesAbortDialog(
              context,
              'Location Error!',
              'Permission Denied',
              'Location permissions are denied (actual value:$permission).',
              true);
          return Future.error(
              'Location permissions are denied (actual value: $permission).');
        }
      }
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      String completeAddress =
          '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality}';
      setState(() {
        displayAddress = completeAddress;
      });
    } catch (e) {
      setState(() {
        displayAddress = "Not Found";
      });
      Helper().showSnackBar(e.toString(), "ERROR", context, true);
      print(e.toString());
    }
  }

  _onStartScroll(ScrollMetrics metrics) {
    Helper().dismissKeyBoard(context);
  }

  @override
  void initState() {
    getTheUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyBoardView(
        child: NotificationListener<ScrollNotification>(
          // ignore: missing_return
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              _onStartScroll(scrollNotification.metrics);
            }
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SafeArea(
                  child: FadeInUp(
                    duration: Duration(seconds: 1),
                    child: HomeHeaderImage(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: UserAddressView(
                    address: displayAddress,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: FadeInUp(
                duration: Duration(seconds: 1),
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: SearchBox(
                    radius: 8,
                    function: null,
                    height: 45.0,
                  ),
                ),
              )),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: AppBanner(
                    bigBanner: false,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: SeeAppTitle(
                    title: "Exclusive Offer",
                    function: () {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 234,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SlideInRight(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 14,
                            ),
                            child: ProductItem(
                              name: "Name",
                              imageUrl:
                                  "https://study.com/cimages/multimages/16/adobestock_34617669.jpeg",
                              price: "55.0",
                              function: () {
                                Helper().goToPage(context, ProductDetail());
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SeeAppTitle(
                  title: "Best Selling",
                  function: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 234,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SlideInRight(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 14,
                            ),
                            child: ProductItem(
                              name: "Name",
                              imageUrl:
                                  "https://study.com/cimages/multimages/16/adobestock_34617669.jpeg",
                              price: "55.0",
                              function: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: SeeAppTitle(
                    title: "Groceries",
                    function: () {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 80.00,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SlideInRight(
                            duration: Duration(milliseconds: 500),
                            child: GroceriesItem());
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: SeeAppTitle(
                    title: "For You",
                    function: () {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 234,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SlideInRight(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 14,
                            ),
                            child: ProductItem(
                              name: "Name",
                              imageUrl:
                                  "https://study.com/cimages/multimages/16/adobestock_34617669.jpeg",
                              price: "55.0",
                              function: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
