import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_app/view/home/home_page.dart';

abstract class IAppRouter {
  Future<bool> enableAndroidBackButton();
  Route<GetPageRoute> initialRoute(RouteSettings settings);
  Route<GetPageRoute> onGenerateRoute(RouteSettings settings);
}

class AppRouter extends GetxController implements IAppRouter {
  factory AppRouter() => instance;
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  @override
  Future<bool> enableAndroidBackButton() async {
    Get.back<dynamic>();
    return false;
  }

  @override
  Route<GetPageRoute> initialRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => HomePage(),
    );
  }

  @override
  Route<GetPageRoute> onGenerateRoute(RouteSettings settings) {
    final name = settings.name ?? '/';
    switch (name) {
      case '/':
        return GetPageRoute(
          settings: settings,
          page: () => HomePage(),
        );
      case '/article':
        return GetPageRoute(
          settings: settings,
          page: () => HomePage(),
        );
      case '/article/details':
        // final args = settings.arguments as Map<String, dynamic>;
        return GetPageRoute(
          settings: settings,
          page: () => HomePage(
              // qiitaInfo: args['qiitaInfo']
              ),
        );
      default:
        return GetPageRoute(
          settings: settings,
          page: () => HomePage(),
        );
    }
  }
}
