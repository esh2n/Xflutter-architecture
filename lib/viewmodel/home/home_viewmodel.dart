import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/view/home/home_page.dart';

abstract class IHomePageViewModel extends GetxController {
  Widget get currentChildView;
  List<BottomNavigationBarItem> get bottomNavigationItems;
  int get currentIndex;
  void updatePageIndex(int index);
}

class HomePageViewModel extends GetxController implements IHomePageViewModel {
  factory HomePageViewModel() => instance;
  HomePageViewModel._() {}
  static final HomePageViewModel instance = HomePageViewModel._();

  int _pageIndex = 0;

  @override
  Widget get currentChildView => _childViews[_pageIndex];

  @override
  List<BottomNavigationBarItem> get bottomNavigationItems =>
      _bottomNavigationItems;

  @override
  int get currentIndex => _pageIndex;

  @override
  void updatePageIndex(int index) {
    _pageIndex = index;
    update();
  }

  final List<Widget> _childViews = <Widget>[
    const First(),
    const Second(),
    const Third(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.no_encryption_sharp, color: Colors.transparent),
      label: 'First',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.no_encryption_sharp, color: Colors.transparent),
      label: 'Second',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.no_encryption_sharp, color: Colors.transparent),
      label: 'Third',
    ),
  ];
}
