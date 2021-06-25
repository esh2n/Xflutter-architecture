import 'package:get/get.dart';

abstract class IMiddleware {
  dynamic observer(Routing? routing);
}

class Middleware extends GetxController implements IMiddleware {
  factory Middleware() => instance;
  Middleware._();
  static final Middleware instance = Middleware._();

  @override
  dynamic observer(Routing? routing) {
    print('call middleware');

    // TODO: routing is always null.
    if (routing != null && routing.current == '/') {
      print('now im home');
    }
  }
}
