import 'package:flutter/material.dart';
import 'package:sliver_app/loading_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: LoadingAnimated(size: size),
      ),
    );
  }
}

class LoadingAnimated extends StatefulWidget {
  final Size size;

  const LoadingAnimated({
    super.key,
    required this.size,
  });

  @override
  State<LoadingAnimated> createState() => _LoadingAnimatedState();
}

class _LoadingAnimatedState extends State<LoadingAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(seconds: 1),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) => LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            transform: _GradientTransform(controller.value),
            colors: const [
              Colors.white10,
              Colors.white,
              Colors.white10,
            ],
          ).createShader(
            bounds,
          ),
          child: LoadingWidget(
            width: widget.size.width,
          ),
        );
      },
    );
  }
}

class _GradientTransform extends GradientTransform {
  final double percent;
  const _GradientTransform(this.percent);
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * percent, 0, 0);
  }
}
