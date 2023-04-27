import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text.rich(TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            text: title,
            children: [
              TextSpan(
                  text: subtitle, style: const TextStyle(color: Colors.blue))
            ])));
  }
}
