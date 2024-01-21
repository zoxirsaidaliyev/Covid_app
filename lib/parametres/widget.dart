import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  MyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: ShapeDecoration(
        color: Color(0xFF1E293B),
        shape: OvalBorder(),
      ),
    );
  }
}
