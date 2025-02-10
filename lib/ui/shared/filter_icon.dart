import 'package:flutter/material.dart';

class FilterIcon extends StatelessWidget {
  final IconData? icon;
  final String label;

  const FilterIcon({
    super.key,
    this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: EdgeInsets.only(right: 8),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(icon, color: Colors.grey),
            ),
          Text(
            label,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
