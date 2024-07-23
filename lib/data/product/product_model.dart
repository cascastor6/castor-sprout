// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'submodels/meta_model.dart';
import 'submodels/reviews_model.dart';

class Product extends Equatable {
  num? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  List<dynamic>? tags;
  String? brand;
  String? sku;
  num? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  num? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;
  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  Product copyWith({
    num? id,
    String? title,
    String? description,
    String? category,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    num? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Reviews>? reviews,
    String? returnPolicy,
    num? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toMap(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews?.map((x) => x.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toMap(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as num : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      discountPercentage: map['discountPercentage'] != null
          ? map['discountPercentage'] as num
          : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      stock: map['stock'] != null ? map['stock'] as num : null,
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      weight: map['weight'] != null ? map['weight'] as num : null,
      dimensions: map['dimensions'] != null
          ? Dimensions.fromMap(map['dimensions'] as Map<String, dynamic>)
          : null,
      warrantyInformation: map['warrantyInformation'] != null
          ? map['warrantyInformation'] as String
          : null,
      shippingInformation: map['shippingInformation'] != null
          ? map['shippingInformation'] as String
          : null,
      availabilityStatus: map['availabilityStatus'] != null
          ? map['availabilityStatus'] as String
          : null,
      reviews: map['reviews'] != null
          ? List<Reviews>.from(
              (map['reviews']).map<Reviews?>(
                (x) => Reviews.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      returnPolicy:
          map['returnPolicy'] != null ? map['returnPolicy'] as String : null,
      minimumOrderQuantity: map['minimumOrderQuantity'] != null
          ? map['minimumOrderQuantity'] as num
          : null,
      meta: map['meta'] != null
          ? Meta.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
      images: map['images'] != null ? List<String>.from((map['images'])) : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, brand: $brand, sku: $sku, weight: $weight, dimensions: $dimensions, warrantyInformation: $warrantyInformation, shippingInformation: $shippingInformation, availabilityStatus: $availabilityStatus, reviews: $reviews, returnPolicy: $returnPolicy, minimumOrderQuantity: $minimumOrderQuantity, meta: $meta, images: $images, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.rating == rating &&
        other.stock == stock &&
        listEquals(other.tags, tags) &&
        other.brand == brand &&
        other.sku == sku &&
        other.weight == weight &&
        other.dimensions == dimensions &&
        other.warrantyInformation == warrantyInformation &&
        other.shippingInformation == shippingInformation &&
        other.availabilityStatus == availabilityStatus &&
        listEquals(other.reviews, reviews) &&
        other.returnPolicy == returnPolicy &&
        other.minimumOrderQuantity == minimumOrderQuantity &&
        other.meta == meta &&
        listEquals(other.images, images) &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        category.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        rating.hashCode ^
        stock.hashCode ^
        tags.hashCode ^
        brand.hashCode ^
        sku.hashCode ^
        weight.hashCode ^
        dimensions.hashCode ^
        warrantyInformation.hashCode ^
        shippingInformation.hashCode ^
        availabilityStatus.hashCode ^
        reviews.hashCode ^
        returnPolicy.hashCode ^
        minimumOrderQuantity.hashCode ^
        meta.hashCode ^
        images.hashCode ^
        thumbnail.hashCode;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Dimensions {
  num? width;
  num? height;
  num? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  Dimensions copyWith({
    num? width,
    num? height,
    num? depth,
  }) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      depth: depth ?? this.depth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'depth': depth,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width'] != null ? map['width'] as num : null,
      height: map['height'] != null ? map['height'] as num : null,
      depth: map['depth'] != null ? map['depth'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Dimensions(width: $width, height: $height, depth: $depth)';

  @override
  bool operator ==(covariant Dimensions other) {
    if (identical(this, other)) return true;

    return other.width == width &&
        other.height == height &&
        other.depth == depth;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ depth.hashCode;
}

final productModelDummy = Product.fromMap(const {
  "id": 1,
  "title": "Essence Mascara Lash Princess",
  "description":
      "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
  "category": "beauty",
  "price": 9.99,
  "discountPercentage": 7.17,
  "rating": 4.94,
  "stock": 5,
  "tags": ["beauty", "mascara"],
  "brand": "Essence",
  "sku": "RCH45Q1A",
  "weight": 2,
  "dimensions": {"width": 23.17, "height": 14.43, "depth": 28.01},
  "warrantyInformation": "1 month warranty",
  "shippingInformation": "Ships in 1 month",
  "availabilityStatus": "Low Stock",
  "reviews": [
    {
      "rating": 2,
      "comment": "Very unhappy with my purchase!",
      "date": "2024-05-23T08:56:21.618Z",
      "reviewerName": "John Doe",
      "reviewerEmail": "john.doe@x.dummyjson.com"
    },
    {
      "rating": 2,
      "comment": "Not as described!",
      "date": "2024-05-23T08:56:21.618Z",
      "reviewerName": "Nolan Gonzalez",
      "reviewerEmail": "nolan.gonzalez@x.dummyjson.com"
    },
    {
      "rating": 5,
      "comment": "Very satisfied!",
      "date": "2024-05-23T08:56:21.618Z",
      "reviewerName": "Scarlett Wright",
      "reviewerEmail": "scarlett.wright@x.dummyjson.com"
    }
  ],
  "returnPolicy": "30 days return policy",
  "minimumOrderQuantity": 24,
  "meta": {
    "createdAt": "2024-05-23T08:56:21.618Z",
    "updatedAt": "2024-05-23T08:56:21.618Z",
    "barcode": "9164035109868",
    "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
  },
  "images": [
    "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"
  ],
  "thumbnail":
      "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
});
