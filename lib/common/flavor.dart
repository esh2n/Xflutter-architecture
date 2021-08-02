import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';

enum Flavor {
  dev,
  stg,
  prod,
}

abstract class IAppFlavor extends GetxController {
  void addConfig(Flavor flavor);
  Flavor getFlavor();
}

class AppFlavor extends GetxController implements IAppFlavor {
  factory AppFlavor() => instance;
  AppFlavor._();
  static final AppFlavor instance = AppFlavor._();

  @override
  void addConfig(Flavor flavor) =>
      FlavorConfig(variables: <String, Flavor>{'flavor': flavor});
  @override
  Flavor getFlavor() => FlavorConfig.instance!.variables!['flavor'] as Flavor;
}
