import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/home/presentation/view_model/home/home_cubit.dart';
import 'package:vision_tech/services/home/presentation/views/home/widgets/category_list.dart';
import 'package:vision_tech/services/home/presentation/views/home/widgets/category_product_card.dart';
import 'package:vision_tech/services/home/presentation/views/home/widgets/custom_home_banners.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/custom_app_bar_sliver.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              CustomAppBarSliver(),
              CustomHomeBanners(),
              CategoryList(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10,
                  ),
                  child: Text(
                    'جميع المنتجات',
                    style: TextStyle(fontSize: 25.sp),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children:
                    context
                        .read<HomeCubit>()
                        .homeProducts
                        .map(
                          (product) =>
                              CategoryProductCard(productModel: product),
                        )
                        .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
