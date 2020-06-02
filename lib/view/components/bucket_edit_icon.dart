import 'package:flutter/material.dart';

class BucketEditActionIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const BucketEditActionIcon({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => onPressed(),
      color: Colors.black54,
    );
  }
}
