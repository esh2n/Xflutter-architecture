import 'package:get/get.dart';

abstract class IMiddleware extends GetxController {
  dynamic observer(Routing? routing);
}

class Middleware extends GetxController implements IMiddleware {
  factory Middleware() => instance;
  Middleware._();
  static final Middleware instance = Middleware._();

  @override
  dynamic observer(Routing? routing) {
    if (routing != null) {
      print('call middleware: ${routing.current}(current route)');
    }
  }
}
