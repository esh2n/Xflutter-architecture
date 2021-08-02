import 'package:get/get.dart';

abstract class IShowCasePageViewModel extends GetxController {}

class ShowCasePageViewModel extends GetxController
    implements IShowCasePageViewModel {
  factory ShowCasePageViewModel() => instance;
  ShowCasePageViewModel._() {
    // '/showcase/:id'
    print('param[id]: ${Get.parameters['id']}');
  }
  static final ShowCasePageViewModel instance = ShowCasePageViewModel._();
}
