import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/services/home/data/categories_enum.dart';

import '../../../view_model/home_cubit.dart';
import '../Category_products_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.category,
  });

  final String imagePath;
  final String title;
  final ProductsCategoriesEnum category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          context.read<HomeCubit>().getCategoryProducts(category);
          Navigator.pushNamed(
            context,
            CategoryProductsView.routeName,
            arguments: category,
          );
        },
        child: Container(
          height: 0.15.sh,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset(imagePath, fit: BoxFit.fill, height: 0.15.sh),
              Text(title, style: TextStyle(fontSize: 16.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
