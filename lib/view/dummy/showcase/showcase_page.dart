import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/view/_component/topbar.dart';
import 'package:sample_app/viewmodel/dummy/showcase/showcase_viewmodel.dart';

class ShowCasePage extends StatelessWidget {
  const ShowCasePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<IShowCasePageViewModel>(ShowCasePageViewModel.instance);

    return Scaffold(
        appBar: MyAppBar('ShowCase'),
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[],
          ),
        ));
  }
}
