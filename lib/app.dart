import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/common/flavor.dart';
import 'package:sample_app/common/theme.dart';

import 'router/app_router.dart';
import 'router/middleware.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static Future<void> init(Flavor flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    final appFlavor = Get.put<IAppFlavor>(AppFlavor.instance);
    appFlavor.addConfig(flavor);
    runApp(const App());
  }

  @override
  Widget build(BuildContext context) {
    final router = Get.put<IAppRouter>(AppRouter.instance);
    final middleware = Get.put<IMiddleware>(Middleware.instance);
    final theme = Get.put<IAppTheme>(AppTheme.instance);
    return GetMaterialApp(
      title: 'app_name',
      theme: theme.themeData,
      initialRoute: router.initialRoute,
      getPages: router.pageList,
      navigatorKey: Get.key,
      routingCallback: middleware.observer,
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      // transitionDuration: Get.defaultDurationTransition,
      // defaultGlobalState: Get.defaultGlobalState,
    );
  }
}
