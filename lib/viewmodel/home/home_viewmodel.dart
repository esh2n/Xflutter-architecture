import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/model/app_user/app_user.dart';
import 'package:sample_app/view/home/home_page.dart';

abstract class IHomePageViewModel extends GetxController {
  Widget get currentChildView;
  List<BottomNavigationBarItem> get bottomNavigationItems;
  int get currentIndex;
  void updatePageIndex(int index);
  Future<void> fetchUserType();
}

class HomePageViewModel extends GetxController implements IHomePageViewModel {
  factory HomePageViewModel() => instance;
  HomePageViewModel._() {
    fetchUserType();
  }
  static final HomePageViewModel instance = HomePageViewModel._();

  int _pageIndex = 0;
  late UserType _userType = UserType.invalid;

  @override
  Widget get currentChildView => _childViews[_userType]![_pageIndex];

  @override
  List<BottomNavigationBarItem> get bottomNavigationItems =>
      _bottomNavigationItems[_userType]!;

  @override
  int get currentIndex => _pageIndex;

  @override
  void updatePageIndex(int index) {
    _pageIndex = index;
    update();
  }

  @override
  // TODO: implement fetchUserType (from usecase)
  Future<void> fetchUserType() async {
    // fetch from api if user is child.
    await Future<dynamic>.delayed(const Duration(seconds: 0));
    _userType = UserType.child;
    update();
  }

  final Map<UserType, List<Widget>> _childViews = {
    UserType.parent: <Widget>[
      const First(),
      const Second(),
      const Third(),
      const Forth(),
    ],
    UserType.child: <Widget>[
      const First(),
      const Second(),
      const Third(),
    ],
    UserType.invalid: <Widget>[
      const First(),
      const Second(),
      const Third(),
    ],
  };

  final Map<UserType, List<BottomNavigationBarItem>> _bottomNavigationItems = {
    UserType.parent: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.show_chart),
        label: 'バイタル',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.question_answer),
        label: '相談',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'マイページ',
      ),
    ],
    UserType.child: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.psychology),
        label: 'トレーニング',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'マイページ',
      ),
    ],
    UserType.invalid: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.no_encryption_sharp, color: Colors.transparent),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.no_encryption_sharp, color: Colors.transparent),
        label: '',
      ),
    ],
  };
}
