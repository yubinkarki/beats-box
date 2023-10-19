import 'package:flutter/material.dart';

class DeadView extends StatelessWidget {
  const DeadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("You've defeated the boss!"),
      ),
    );
  }
}
