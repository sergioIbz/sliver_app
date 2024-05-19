import 'package:flutter/material.dart';
import 'package:sliver_app/loading_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: LoadingWidget(width: size.width),
      ),
    );
  }
}


