import 'package:flutter/material.dart';

Widget customImageGridview(List<String> imageUrls) {
  List<Row> rows = [];

  for (int i = 0; i < imageUrls.length; i += 2) {
    List<Widget> rowChildren = [];

    rowChildren.add(_buildImage(imageUrls[i]));

    if (i + 1 < imageUrls.length) {
      rowChildren.add(_buildImage(imageUrls[i + 1]));
    } else {
      rowChildren.add(Expanded(child: Container()));
    }

    rows.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowChildren,
      ),
    );
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: rows,
  );
}

Widget _buildImage(String imageUrl) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.network(
        imageUrl,
        height: 200,
      ),
    ),
  );
}
