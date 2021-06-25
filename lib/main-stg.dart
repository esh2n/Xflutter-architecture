import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'app.dart';
import 'common/flavors.dart';

void main() {
  FlavorConfig(variables: <String, Flavor>{'flavor': Flavor.stg});
  runApp(App());
}
