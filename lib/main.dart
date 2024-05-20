import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_app/home.dart';
import 'package:sliver_app/slide_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(create: (context) => SliderProvider(),child: const Home(),),
    );
  }
}
