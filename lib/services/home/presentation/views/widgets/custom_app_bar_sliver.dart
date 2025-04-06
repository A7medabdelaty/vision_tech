import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarSliver extends StatelessWidget {
  const CustomAppBarSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Image.asset('assets/images/text_logo.png', width: 0.4.sw),
      floating: true,
      pinned: true,
      backgroundColor: Color(0xff220A0A),
      leadingWidth: 0.3.sw,
      leading: Row(
        children: [
          IconButton(
            icon: Icon(Icons.phone, color: Colors.yellowAccent, size: 20.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.yellowAccent, size: 20.sp),
            onPressed: () {},
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.yellowAccent, size: 20.sp),
        ),
      ],
    );
  }
}
