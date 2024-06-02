import 'package:evoltsoft/utils/colors.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    super.key,
    required this.h,
    required this.w,
    required this.title,
    required this.val,
  });

  final double h;
  final double w;
  final String title, val;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.13,
      width: w * 0.37,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      decoration: BoxDecoration(
          color: dotColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            val,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
