import 'package:flutter/material.dart';

class CustomTextMessage extends StatelessWidget {
  const CustomTextMessage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ));
  }
}
