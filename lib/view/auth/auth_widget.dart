import 'package:flutter/material.dart';
import 'package:sample_app/view/home/home_page.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({required this.builder, Key? key}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<User>) builder;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: Stream<User>.fromFuture(getUser()),
      builder: builder,
    );
  }
}

//**********************************
//* Authウィジェット
//*   - 認証情報に応じて遷移先を変える
//**********************************

class AuthWidget extends StatelessWidget {
  const AuthWidget({required this.userSnapshot, Key? key}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;
  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active ||
        userSnapshot.connectionState == ConnectionState.done) {
      return userSnapshot.hasData ? HomePage() : Container();
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// TODO(someone): move to model layer
class User {
  const User(this.name);
  final String name;
}

Future<User> getUser() async {
  await Future.delayed(Duration(seconds: 1));
  return User('Taro');
}
