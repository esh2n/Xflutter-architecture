import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/viewmodel/home/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put<IHomePageViewModel>(HomePageViewModel.instance);
    return const Scaffold(
      body: _HomeBody(),
      bottomNavigationBar: _HomeBottomBar(),
    );
  }
}

// TODO: convert to common class
class _HomeAppBar {
  AppBar get _ => AppBar(title: const Text('ホーム'));
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

// TODO: devide page

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeAppBar()._,
      body: Center(
        child: Container(child: const Text('1111111111111111')),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: const Text('222222222222222')));
  }
}

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: const Text('333333333333333')));
  }
}

class Forth extends StatelessWidget {
  const Forth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: const Text('444444444444444')));
  }
}
