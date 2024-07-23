import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final VoidCallback? onLeadingPress;
  final Icon? leadingIcon;

  const CustomScaffold({
    super.key,
    this.title,
    this.onLeadingPress,
    this.leadingIcon,
    required this.body,
  });

  const CustomScaffold.back({
    super.key,
    this.title,
    this.onLeadingPress,
    this.leadingIcon = const Icon(Icons.arrow_back),
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingIcon != null
            ? GestureDetector(
                onTap: onLeadingPress ??
                    () {
                      Navigator.pop(context);
                    },
                child: leadingIcon,
              )
            : null,
        title: Text(title ?? ''),
      ),
      body: body,
    );
  }
}
