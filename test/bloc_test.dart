import 'package:bloc_test/bloc_test.dart';
import 'package:castor_sprout/bloc/product_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_data.dart';

void main() {
  group('ProductCubit Tests', () {
    late ProductCubit productCubit;

    setUp(() {
      productCubit = ProductCubit();
    });

    tearDown(() {
      productCubit.close();
    });

    test('initial value is ProductStateInitial', () {
      expect(productCubit.state, ProductStateInitial());
    });

    blocTest<ProductCubit, ProductState>(
      'emits ProductStateLoading then ProductStateSuccess on FetchSingleProduct',
      build: () => productCubit,
      act: (bloc) => bloc.fetchSingleProduct(id: 1),
      expect: () => <ProductState>[
        ProductStateLoading(),
        ProductStateSuccess(productList: [TestData().dummyProductDetails()])
      ],
    );

    blocTest<ProductCubit, ProductState>(
      'emits ProductStateLoading then ProductStateSuccess on FetchProductList',
      build: () => productCubit,
      act: (bloc) => bloc.fetchProductList(paginationSkip: 0),
      expect: () => <ProductState>[
        ProductStateLoading(),
        ProductStateSuccess(productList: TestData().dummyProductList())
      ],
    );
  });
}
