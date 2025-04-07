import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_tech/services/home/presentation/view_model/home_cubit.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/product_card_item.dart';

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        final productModel = context.read<HomeCubit>().homeProducts[index];
        return ProductCard(productModel: productModel);
      },
      itemCount: context.read<HomeCubit>().homeProducts.length,
    );
  }
}
