import 'package:OnlineGroceryStore/helper/theme.dart';
import 'package:OnlineGroceryStore/screen/welcomeScreen/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
            create: (context) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
              theme: light,
              title: 'Online Grocery Store',
              home: WelcomeScreen());
        },
      ),
    );
  }
}
