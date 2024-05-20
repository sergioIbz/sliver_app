import 'package:flutter/material.dart';
import 'package:sliver_app/loading_animated.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: List.generate(
          10,
          (index) => LoadingAnimated(size: size),
        ),
      ),
    );
  }
}
