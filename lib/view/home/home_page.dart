import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/view/_component/topbar.dart';
import 'package:sample_app/viewmodel/home/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<IHomePageViewModel>(HomePageViewModel.instance);
    return const Scaffold(
      body: _HomeBody(),
      bottomNavigationBar: _HomeBottomBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<IHomePageViewModel>();
    return GetBuilder<IHomePageViewModel>(
      init: viewModel,
      builder: (_) {
        return viewModel.currentChildView;
      },
    );
  }
}

class _HomeBottomBar extends StatelessWidget {
  const _HomeBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<IHomePageViewModel>();
    return GetBuilder<IHomePageViewModel>(
        init: viewModel,
        builder: (_) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            currentIndex: viewModel.currentIndex,
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: viewModel.bottomNavigationItems,
            onTap: (int index) => {viewModel.updatePageIndex(index)},
          );
        });
  }
}

// TODO(someone): devide page

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('First'),
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () async {
              // await Get.toNamed<dynamic>('/');
            },
            child: const Text('Text Button'),
          ),
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Second'),
      body: Center(
          child: Container(
        child: TextButton(
          onPressed: () async {
            // await Get.toNamed<dynamic>('/');
          },
          child: const Text('Text Button'),
        ),
      )),
    );
  }
}

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Third'),
      body: Center(
          child: Container(
        child: TextButton(
          onPressed: () async {
            await Get.toNamed<dynamic>(
                '/showcase/34954?flag=true&country=japan');
          },
          child: const Text('Showcase Page'),
        ),
      )),
    );
  }
}
