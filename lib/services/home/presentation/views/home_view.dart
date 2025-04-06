import 'package:flutter/material.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/category_list.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/custom_app_bar_sliver.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/custom_home_banners.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomAppBarSliver(),
          CustomHomeBanners(),
          CategoryList(),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return ListTile(title: Text('Item #$index'));
            }, childCount: 100),
          ),
        ],
      ),
    );
  }
}
