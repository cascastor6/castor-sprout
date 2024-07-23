import 'package:castor_sprout/bloc/product_cubit.dart';
import 'package:castor_sprout/presentation/common/custom_image_gridview.dart';
import 'package:castor_sprout/presentation/common/custom_scaffold.dart';
import 'package:castor_sprout/presentation/features/single/widget/detail_row_widget.dart';
import 'package:castor_sprout/presentation/features/single/widget/review_row_widget.dart';
import 'package:castor_sprout/utils/extensions.dart';
import 'package:castor_sprout/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';
  final num id;
  final String productName;
  const DetailsScreen({super.key, required this.id, required this.productName});

  @override
  State<DetailsScreen> createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  final ProductCubit _productCubit = ProductCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productCubit.fetchSingleProduct(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.back(
        title: widget.productName,
        body: BlocProvider(
          create: (context) => _productCubit,
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductStateSuccess) {
                final product = state.productList.first;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              product.thumbnail!,
                              height: 100,
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  product.title!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  product.description!,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              DetailRow(
                                title: 'Category',
                                info: product.category!.capitalize(),
                                firstItem: true,
                              ),
                              DetailRow(
                                title: 'Price',
                                customWidgetinfo: Row(
                                  children: [
                                    Text(
                                      '\$${(product.price! * ((100 - product.discountPercentage!) / 100)).toStringAsFixed(2)}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const HSpace.md(),
                                    Text(
                                      '\$${product.price!}',
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    const HSpace.md(),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            '${product.discountPercentage!}% OFF',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              DetailRow(
                                title: 'Rating',
                                customWidgetinfo: Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 25,
                                      allowHalfRating: true,
                                      initialRating: product.rating!.toDouble(),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                      ignoreGestures: true,
                                    ),
                                    Text(
                                      product.rating.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              DetailRow(
                                title: 'Stock',
                                info: product.stock.toString(),
                              ),
                              DetailRow(
                                title: 'Tags',
                                customWidgetinfo: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: product.tags!
                                        .map((e) => Container(
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text(
                                                '#$e',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )))
                                        .toList()),
                              ),
                              DetailRow(
                                title: 'Brand',
                                info: product.brand,
                              ),
                              DetailRow(
                                title: 'SKU',
                                info: product.sku,
                              ),
                              DetailRow(
                                title: 'Weight',
                                info: product.weight.toString(),
                              ),
                              DetailRow(
                                  title: 'Dimensions',
                                  customWidgetinfo: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            'Width: ${product.dimensions!.width}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            'Height: ${product.dimensions!.height}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            'Depth: ${product.dimensions!.depth}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ])),
                              DetailRow(
                                title: "Warranty Information",
                                info: product.warrantyInformation,
                              ),
                              DetailRow(
                                title: "Shipping Information",
                                info: product.shippingInformation,
                              ),
                              DetailRow(
                                title: "Availability Status",
                                info: product.availabilityStatus,
                              ),
                              DetailRow(
                                title: "Return Policy",
                                info: product.returnPolicy,
                              ),
                              DetailRow(
                                title: "Minimum Order Quantity",
                                info: product.minimumOrderQuantity.toString(),
                              )
                            ],
                          ),
                        ),
                        if (product.reviews != null)
                          Card(
                            child: Column(children: [
                              const Text(
                                'Reviews',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ...product.reviews!
                                  .map((review) => ReviewRow(
                                        review: review,
                                      ))
                                  .toList(),
                            ]),
                          ),
                        if (product.images != null)
                          Card(
                            child: Column(
                              children: [
                                const Text(
                                  'Images',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                customImageGridview(product.images!),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }
              if (state is ProductStateInitial ||
                  state is ProductStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
