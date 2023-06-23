import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bsafe/providers/phone_validation_provider.dart';
import 'package:flutter_bsafe/utils/routes.dart';
import 'package:flutter_bsafe/views/screens/home/home_screen.dart';
import 'package:flutter_bsafe/views/screens/login/login_screen.dart';
import 'package:flutter_bsafe/views/screens/search/apps_screen.dart';
import 'package:flutter_bsafe/views/screens/search/imei_screen.dart';
import 'package:flutter_bsafe/views/screens/search/phone_screen.dart';
import 'package:flutter_bsafe/views/screens/search/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.initPref();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  String _defaultRoute = Routes.ROUTE_LOGIN;
  runApp(new MyApp(
    defaultRoute: _defaultRoute,
  ));
}

class MyApp extends StatefulWidget {
  String? defaultRoute;

  MyApp({this.defaultRoute});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => PhoneValidation())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BSafe',
            theme:
                ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Segoe UI'),
            initialRoute: widget.defaultRoute,
            routes: {
              Routes.ROUTE_LOGIN: (context) => LoginScreen(),
              Routes.ROUTE_HOME: (context) => HomeScreen(),
              Routes.ROUTE_SEARCH: (context) => SearchScreen(),
              Routes.ROUTE_APPS: (context) => AppsScreen(),
              Routes.ROUTE_IMEI: (context) => ImeiScreen(),
              Routes.ROUTE_PHONE: (context) => PhoneScreen(),
            },
            //home: LoginScreen(),
          ),
        );
      },
    );
  }
}
