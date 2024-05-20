import 'package:flutter/material.dart';
import 'package:sliver_app/loading_widget.dart';

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
        period: const Duration(milliseconds: 1300),
      );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
    return Matrix4.translationValues(bounds.width *percent, 0, 0);
  }
}
