import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/firebase/my_firebase.dart';
import 'package:mobile_app/core/utils/Routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyFirebase().init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPreferences.getBool("onboarding") ?? false;
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) =>
        onBoarding ? MyRoutes.intitial1 : MyRoutes.intitialRoute,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => materialApp, // Wrap your app
    ),
  );
}
