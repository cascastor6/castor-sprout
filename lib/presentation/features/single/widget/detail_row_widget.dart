import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String? info;
  final Widget? customWidgetinfo;
  final bool firstItem;
  const DetailRow({
    super.key,
    required this.title,
    this.info,
    this.customWidgetinfo,
    this.firstItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!firstItem) const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              info != null
                  ? Text(
                      info!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  : customWidgetinfo ?? SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
