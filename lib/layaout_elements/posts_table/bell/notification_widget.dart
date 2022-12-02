import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          'I am notification widget. I will be implemented.',
          style: TextStyle(fontSize: 20.0, color: Colors.red),
        ),
      ),
    );
  }
}
