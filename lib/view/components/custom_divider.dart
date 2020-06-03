import 'package:flutter/material.dart';
import 'package:flutter_task/view/styles/style.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(defaultBorderColor), width: 1),
        ),
      ),
    );
  }
}
