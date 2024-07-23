import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../data/product/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateInitial());

  Future<void> fetchProductList({required int paginationSkip}) async {
    emit(ProductStateLoading());
    try {
      final url = Uri.parse(
          'https://dummyjson.com/products?limit=10&skip=$paginationSkip&select=title,price,thumbnail,stock,discountPercentage');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> jsonProductList = jsonResponse['products'];
        final List<Product> productList =
            jsonProductList.map((product) => Product.fromMap(product)).toList();

        emit(ProductStateSuccess(productList: productList));
        print('success');
      } else {
        emit(const ProductStateFailure('Failed to load products'));
      }
    } catch (error) {
      emit(ProductStateFailure(error.toString()));
    }
  }

  Future<void> fetchSingleProduct({required num id}) async {
    emit(ProductStateLoading());
    try {
      final url = Uri.parse('https://dummyjson.com/products/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Product product = Product.fromJson(response.body);
        emit(ProductStateSuccess(productList: [product]));
      } else {
        emit(const ProductStateFailure('Failed to load product'));
      }
    } catch (error) {
      emit(ProductStateFailure(error.toString()));
    }
  }
}

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductStateInitial extends ProductState {}

class ProductStateLoading extends ProductState {}

class ProductStateSuccess extends ProductState {
  final List<Product> productList;

  const ProductStateSuccess({required this.productList});
}

class ProductStateFailure extends ProductState {
  final String error;

  const ProductStateFailure(this.error);
}
