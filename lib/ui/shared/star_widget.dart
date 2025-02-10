import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.amber),
          SizedBox(width: 3),
          Text("4,6"),
        ],
      )
    );
  }
}