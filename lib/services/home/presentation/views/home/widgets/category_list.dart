import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/categories_enum.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 0.25.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'الأقسام',
                style: TextStyle(fontSize: 25.sp),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 0.2.sh,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(
                    imagePath: 'assets/images/finger_print_category_image.png',
                    title: 'أجهزة البصمة',
                    category: ProductsCategoriesEnum.fingerPrint,
                  ),
                  CategoryItem(
                    imagePath: 'assets/images/cam_category_image.png',
                    title: 'كاميرات المراقبة',
                    category: ProductsCategoriesEnum.securityCameras,
                  ),
                  CategoryItem(
                    imagePath: 'assets/images/storage_category_image.png',
                    title: 'هاردات تسجيل',
                    category: ProductsCategoriesEnum.storageDevices,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
