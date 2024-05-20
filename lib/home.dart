import 'package:flutter/material.dart';
import 'package:sliver_app/loading_animated.dart';
import 'package:sliver_app/loading_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: 20,
        cacheExtent: 1500,
        itemBuilder: (BuildContext context, int index) {
          return LoadingAnimated(
            LoadingWidget(
              width: size.width,
            ),
          );
        },
      ),
    );
  }
}
