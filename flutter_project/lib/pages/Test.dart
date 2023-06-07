import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final myToken;
  const Test({super.key, required this.myToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${myToken}"),
      ),
    );
  }
}
