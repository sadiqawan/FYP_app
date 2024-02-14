import 'package:flutter/material.dart';

class MyAccountButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const MyAccountButton({super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [Icon(icon), Text(text)],
      ),
    );
  }
}
