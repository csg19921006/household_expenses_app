import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const CommonButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.add),
              label: const Text('text'),
              style: ElevatedButton.styleFrom(),
            ),
          ),
        ),
      ],
    );
  }
}
