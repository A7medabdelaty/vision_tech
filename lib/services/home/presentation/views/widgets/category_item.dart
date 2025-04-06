import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.imagePath, required this.title});
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
    );
  }
}
