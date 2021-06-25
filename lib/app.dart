import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'router/app_router.dart';
import 'router/middleware.dart';
import 'view/home/home_page.dart';

class App extends StatelessWidget {
  final router = Get.put<IAppRouter>(AppRouter.instance);
  final middleware = Get.put<IMiddleware>(Middleware.instance);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sample',
      theme: _Theme()._,
      home: HomePage(),
      onGenerateRoute: router.onGenerateRoute,
      onUnknownRoute: router.initialRoute,
      navigatorKey: Get.key,
      navigatorObservers: [
        GetObserver(middleware.observer),
      ],
    );
  }
}

// TODO: convert to singleton class and move to constraints class
class _Theme {
  ThemeData get _ => ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
            centerTitle: false,
            color: Colors.white,
            textTheme: TextTheme(
                headline6: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))),
      );
}
