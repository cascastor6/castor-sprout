import 'dart:convert';

import 'package:castor_sprout/data/product/product_model.dart';

class TestData {
  List<Product> dummyProductList() {
    const dummyProductsJson = '''{
          "products": [
            {
              "id": 1,
              "title": "Essence Mascara Lash Princess",
              "price": 9.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
              "stock": 5,
              "discountPercentage": 7.17
            },
            {
              "id": 2,
              "title": "Eyeshadow Palette with Mirror",
              "price": 19.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png",
              "stock": 44,
              "discountPercentage": 5.5
            },
            {
              "id": 3,
              "title": "Powder Canister",
              "price": 14.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png",
              "stock": 59,
              "discountPercentage": 18.14
            },
            {
              "id": 4,
              "title": "Red Lipstick",
              "price": 12.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/thumbnail.png",
              "stock": 68,
              "discountPercentage": 19.03
            },
            {
              "id": 5,
              "title": "Red Nail Polish",
              "price": 8.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png",
              "stock": 71,
              "discountPercentage": 2.46
            },
            {
              "id": 6,
              "title": "Calvin Klein CK One",
              "price": 49.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png",
              "stock": 17,
              "discountPercentage": 0.32
            },
            {
              "id": 7,
              "title": "Chanel Coco Noir Eau De",
              "price": 129.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/fragrances/Chanel%20Coco%20Noir%20Eau%20De/thumbnail.png",
              "stock": 41,
              "discountPercentage": 18.64
            },
            {
              "id": 8,
              "title": "Dior J'adore",
              "price": 89.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/fragrances/Dior%20J'adore/thumbnail.png",
              "stock": 91,
              "discountPercentage": 17.44
            },
            {
              "id": 9,
              "title": "Dolce Shine Eau de",
              "price": 69.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/fragrances/Dolce%20Shine%20Eau%20de/thumbnail.png",
              "stock": 3,
              "discountPercentage": 11.47
            },
            {
              "id": 10,
              "title": "Gucci Bloom Eau de",
              "price": 79.99,
              "thumbnail":
                  "https://cdn.dummyjson.com/products/images/fragrances/Gucci%20Bloom%20Eau%20de/thumbnail.png",
              "stock": 93,
              "discountPercentage": 8.9
            }
          ],
          "total": 194,
          "skip": 0,
          "limit": 10
        }''';

    final List<dynamic> jsonProductList =
        jsonDecode(dummyProductsJson)['products'];
    final List<Product> productList =
        jsonProductList.map((product) => Product.fromMap(product)).toList();

    return productList;
  }

  Product dummyProductDetails() {
    const dummyProductJson =
        '''{"id":1,"title":"Essence Mascara Lash Princess","description":"The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.","category":"beauty","price":9.99,"discountPercentage":7.17,"rating":4.94,"stock":5,"tags":["beauty","mascara"],"brand":"Essence","sku":"RCH45Q1A","weight":2,"dimensions":{"width":23.17,"height":14.43,"depth":28.01},"warrantyInformation":"1 month warranty","shippingInformation":"Ships in 1 month","availabilityStatus":"Low Stock","reviews":[{"rating":2,"comment":"Very unhappy with my purchase!","date":"2024-05-23T08:56:21.618Z","reviewerName":"John Doe","reviewerEmail":"john.doe@x.dummyjson.com"},{"rating":2,"comment":"Not as described!","date":"2024-05-23T08:56:21.618Z","reviewerName":"Nolan Gonzalez","reviewerEmail":"nolan.gonzalez@x.dummyjson.com"},{"rating":5,"comment":"Very satisfied!","date":"2024-05-23T08:56:21.618Z","reviewerName":"Scarlett Wright","reviewerEmail":"scarlett.wright@x.dummyjson.com"}],"returnPolicy":"30 days return policy","minimumOrderQuantity":24,"meta":{"createdAt":"2024-05-23T08:56:21.618Z","updatedAt":"2024-05-23T08:56:21.618Z","barcode":"9164035109868","qrCode":"https://assets.dummyjson.com/public/qr-code.png"},"images":["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],"thumbnail":"https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"}''';
    final Product product = Product.fromJson(dummyProductJson);
    return product;
  }
}
