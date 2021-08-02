import 'package:get/get.dart';
import 'package:sample_app/view/auth/auth_widget.dart';
import 'package:sample_app/view/dummy/showcase/showcase_page.dart';

abstract class IAppRouter {
  Future<bool> enableAndroidBackButton();
  String get initialRoute;
  List<GetPage> get pageList;
}

class AppRouter extends GetxController implements IAppRouter {
  factory AppRouter() => instance;
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  @override
  String get initialRoute => '/';

  @override
  List<GetPage> get pageList => _pageList;

  final _pageList = <GetPage>[
    GetPage(
      name: '/',
      page: () => AuthWidgetBuilder(builder: (context, userSnapshot) {
        return AuthWidget(userSnapshot: userSnapshot);
      }),
    ),
    GetPage(
      // dynamic parameters
      name: '/showcase/:id',
      page: () => const ShowCasePage(),
    ),
  ];

  @override
  Future<bool> enableAndroidBackButton() async {
    Get.back<dynamic>();
    return false;
  }
}
