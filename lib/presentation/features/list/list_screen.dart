import 'package:castor_sprout/bloc/product_cubit.dart';
import 'package:castor_sprout/presentation/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/product/product_model.dart';
import '../../common/custom_scaffold.dart';
import 'widget/list_item_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ScrollController _scrollController = ScrollController();

  final ProductCubit _productCubit = ProductCubit();

  final List<Product> _productList = [];

  @override
  void initState() {
    super.initState();
    _productCubit.fetchProductList(paginationSkip: 0);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: BlocProvider(
        create: (context) => _productCubit,
        child: BlocConsumer<ProductCubit, ProductState>(
          bloc: _productCubit,
          listener: (context, state) {
            if (state is ProductStateSuccess) {
              _productList.addAll(state.productList);
            }
          },
          builder: (context, state) {
            if (state is ProductStateInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductStateSuccess) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(children: [
                  ..._productList.map((e) => ListItemWidget(product: e)),
                  CustomButton(
                      onPressed: () {
                        _productCubit.fetchProductList(
                            paginationSkip: _productList.length);
                      },
                      buttonText: "Get More")
                ]),
              );
            }
            if (state is ProductStateLoading) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(children: [
                  ..._productList.map((e) => ListItemWidget(product: e)),
                  const CircularProgressIndicator(),
                ]),
              );
            }
            if (state is ProductStateFailure) {
              const Text('Error loading');
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
