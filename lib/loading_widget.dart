import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const LoadingWidget({
    super.key,
    required this.width,
    this.color = const Color(0xFF9F8CC2),
  }) : height = width * 0.2;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: width * 0.05),
          CircleAvatar(
            radius: height / 2,
            backgroundColor: color,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                height: height / 3,
                width: width * 0.65,
                color: color,
              )
            ],
          )
        ],
      ),
    );
  }
}