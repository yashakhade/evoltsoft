import 'package:evoltsoft/utils/colors.dart';
import 'package:flutter/material.dart';

class ListtTileWidget extends StatelessWidget {
  const ListtTileWidget({
    super.key,
    required this.leadingData,
    required this.trailingData,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  final IconData leadingData, trailingData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dotColor,
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: Icon(
          leadingData,
          color: Colors.white,
        ),
        trailing: Icon(
          trailingData,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
