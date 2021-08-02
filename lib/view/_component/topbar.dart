import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar(this.title, {Key? key})
      : preferredSize = const Size.fromHeight(50),
        super(key: key);
  @override
  final Size preferredSize;

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
    );
  }
}
