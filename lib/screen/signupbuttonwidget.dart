import 'package:flutter/material.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final String title,subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onTap,
        child: Text.rich(
            TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                text:title,
                children: [
                  TextSpan( text: subtitle,
                      style: TextStyle(color: Colors.blue))
                ]
            )
        )
    );
  }
}