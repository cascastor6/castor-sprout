import 'package:castor_sprout/presentation/features/single/details_screen.dart';
import 'package:castor_sprout/utils/navigate.dart';
import 'package:castor_sprout/utils/spacers.dart';

import '../../../../data/product/product_model.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  final Product product;
  const ListItemWidget({super.key, required this.product});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          navigate(
              context,
              DetailsScreen(
                id: widget.product.id!,
                productName: widget.product.title!,
              ));
        },
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    widget.product.thumbnail!,
                    height: 100,
                  ),
                ),
                const HSpace.md(),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      widget.product.discountPercentage == null
                          ? Text(
                              '\$${widget.product.price!}',
                              style: const TextStyle(fontSize: 18),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$${(widget.product.price! * ((100 - widget.product.discountPercentage!) / 100)).toStringAsFixed(2)}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    HSpace.md(),
                                    Text(
                                      '\$${widget.product.price!}',
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    HSpace.md(),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            '${widget.product.discountPercentage!}% OFF',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ))
                                  ],
                                ),
                                Text('Stock Left: ${widget.product.stock}')
                              ],
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
