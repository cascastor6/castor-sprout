import 'package:castor_sprout/data/product/submodels/reviews_model.dart';
import 'package:castor_sprout/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewRow extends StatelessWidget {
  final Reviews review;

  const ReviewRow({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.reviewerName!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            review.reviewerEmail!,
            style: const TextStyle(color: Colors.blueGrey),
          ),
          RatingBar.builder(
            itemSize: 20,
            initialRating: review.rating!.toDouble(),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
            ignoreGestures: true,
          ),
          Text(
            review.comment!,
          ),
        ],
      ),
    );
  }
}
