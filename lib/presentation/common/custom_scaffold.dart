import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final VoidCallback? onLeadingPress;
  final Icon? leadingIcon;

  const CustomScaffold({
    Key? key,
    this.title,
    this.onLeadingPress,
    this.leadingIcon,
    required this.body,
  }) : super(key: key);

  const CustomScaffold.back({
    Key? key,
    this.title,
    this.onLeadingPress,
    this.leadingIcon = const Icon(Icons.arrow_back),
    required this.body,
  }) : super(key: key);

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
