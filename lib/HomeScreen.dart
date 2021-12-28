import 'package:flutter/material.dart';

import 'SearchPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // resizeToAvoidBottomInset: false,
      body: SearchPage(),
    );
  }
}
