import 'package:crop_yield/resources/style_resources.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_routes/app_routes.dart';
import 'constants/routes_constants.dart';
import 'network/network_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TextFile.appName,
      debugShowCheckedModeBanner: false,
      theme: myThemeData,
      initialBinding: NetworkBinding(),
      initialRoute: Routes.initialRoute,
      getPages: appRoutes(),
    );
  }
}
