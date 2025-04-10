import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/home/presentation/views/home/widgets/category_product_card.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/custom_app_bar_sliver.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/product_card_item.dart';

import '../../../../../core/json_helper.dart';
import '../../../data/categories_enum.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../../view_model/home/home_cubit.dart';

class CategoryProductsView extends StatelessWidget {
  static const String routeName = 'categoryProductsView';

  const CategoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsCategoriesEnum? categoriesEnum =
        ModalRoute.of(context)?.settings.arguments as ProductsCategoriesEnum?;

    // Handle the case where categoriesEnum is null.  This prevents a crash if the argument isn't passed correctly.
    if (categoriesEnum == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Category not specified.")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // Wrap the BlocBuilder in a Scaffold to ensure consistent layout.
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetCategoryProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCategoryProductsError) {
            return Center(
              child: Text("Error: ${state.error}"),
            ); // Include "Error:" for clarity.
          } else if (state is GetCategoryProductsSuccess) {
            // Remove print statement in production code.  Use a logger if needed.
            // print(state.categoryProducts);
            return CustomScrollView(
              slivers: [
                CustomAppBarSliver(
                  leadingWidget: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.yellowAccent,
                      size: 20.sp,
                    ),
                  ),
                ),
                //ProductsList(products: state.categoryProducts),
                SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  children:
                      state.categoryProducts
                          .map(
                            (product) =>
                                CategoryProductCard(productModel: product),
                          )
                          .toList(),
                ),
              ],
            );
          } else {
            // Handle unexpected states more gracefully.
            return const Center(child: Text("Unexpected state."));
          }
        },
      ),
    );
  }
}
