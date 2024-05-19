import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const LoadingWidget({
    super.key,
    required this.width,
    this.color = const Color(0xFFB9B9BC),
  }) : height = width * 0.2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 10),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05)
                    .copyWith(bottom: height / 5),
                height: height / 5,
                width: width * 0.325,
                color: color,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05)
                    .copyWith(bottom: height / 5),
                height: height / 5,
                width: width * 0.65,
                color: color,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                height: height / 5,
                width: width * 0.1625,
                color: color,
              ),
            ],
          )
        ],
      ),
    );
  }
}
