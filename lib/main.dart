import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/cubit/parent_cubit.dart';
import 'package:mobile_app/core/firebase/my_firebase.dart';
import 'package:mobile_app/core/utils/Routing.dart';
import 'package:mobile_app/core/utils/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyFirebase().init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPreferences.getBool("onboarding") ?? false;
  BlocProvider<ParentCubit> materialApp = BlocProvider(
    create: (context) => ParentCubit.instance,
    child: BlocBuilder<ParentCubit, ParentState>(
      builder: (context, state) {
        return MaterialApp(
          theme: MyTheme.Instance.light,
          darkTheme: MyTheme.Instance.dark,
          themeMode: ParentCubit.instance.themeMode,
          builder: DevicePreview.appBuilder,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRoutes.onGenerateRoute,
          onGenerateInitialRoutes: (_) =>
              onBoarding ? MyRoutes.intitial1 : MyRoutes.intitialRoute,
        );
      },
    ),
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => materialApp, // Wrap your app
    ),
  );
}
