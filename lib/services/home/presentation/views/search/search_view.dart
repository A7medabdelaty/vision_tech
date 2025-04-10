import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/core/json_helper.dart';
import 'package:vision_tech/services/home/data/product_model.dart';
import 'package:vision_tech/services/home/data/repos/home_repo_impl.dart';
import 'package:vision_tech/services/home/presentation/view_model/home/home_cubit.dart';
import 'package:vision_tech/services/home/presentation/views/widgets/product_card_item.dart';

class SearchView extends StatefulWidget {
  static const String routeName = '/search';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    final homeCubit = context.read<HomeCubit>();

    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults =
            homeCubit.homeProducts
                .where((product) => product.title.toLowerCase().contains(query))
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16.sp,
                ),
              ),
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body:
              _searchResults.isEmpty && _searchController.text.isNotEmpty
                  ? Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  )
                  : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final product = _searchResults[index];
                      return ProductCard(productModel: product);
                    },
                  ),
        );
      },
    );
  }
}
