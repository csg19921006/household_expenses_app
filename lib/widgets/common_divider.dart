import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1.0, height: 1.0, color: Colors.grey[300]);
  }
}
