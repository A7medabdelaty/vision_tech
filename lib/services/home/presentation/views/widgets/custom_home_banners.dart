import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'banner_item.dart';

class CustomHomeBanners extends StatelessWidget {
  const CustomHomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 0.15.sh,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            BannerItem(imagePath: 'assets/images/finger_print_cover.jpeg'),
            BannerItem(imagePath: 'assets/images/security_cam_cover.jpeg'),
            BannerItem(imagePath: 'assets/images/storage_cover.jpeg'),
          ],
        ),
      ),
    );
  }
}
