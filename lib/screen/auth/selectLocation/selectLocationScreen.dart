import 'package:OnlineGroceryStore/helper/helper.dart';
import 'package:OnlineGroceryStore/screen/auth/selectLocation/selectlocationUI.dart';
import 'package:OnlineGroceryStore/screen/home/homeMain.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:OnlineGroceryStore/widget/appDialogs.dart';

class SelectLocation extends StatefulWidget {
  SelectLocation({Key key}) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final landMarkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Placemark placemark;

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
      setState(() {
        placemark = placemarks[0];
      });
      String completeAddress =
          '${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality} ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
      print(completeAddress);
      print(placemark.country);
      addressLine2Controller.text = completeAddress;
    } catch (e) {
      Helper().showSnackBar(e.toString(), "ERROR", context, true);
      print(e.toString());
    }
  }

  void saveAddress() {
    if (_formKey.currentState.validate()) {
      Helper().dismissKeyBoard(context);
      Helper().goToPage(context, HomeMain());
    } else {
      Helper().vibratPhone();
    }
  }

  @override
  void initState() {
    getTheUserLocation();
    super.initState();
  }

  @override
  void dispose() {
    addressLine1Controller.dispose();
    addressLine2Controller.dispose();
    landMarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectLocastion(
      getTheUserLocation: getTheUserLocation,
      addressLine1Controller: addressLine1Controller,
      addressLine2Controller: addressLine2Controller,
      placemark: placemark,
      landMarkController: landMarkController,
      formKey: _formKey,
      saveAddress: saveAddress,
    );
  }
}
