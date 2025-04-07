import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vision_tech/services/home/data/categories_enum.dart';
import 'package:vision_tech/services/home/data/repos/home_repo.dart';

import '../../data/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  List<Product> homeProducts = [];
  void getHomeProducts() async {
    emit(GetHomeProductsLoading());
    try {
      homeProducts = await homeRepo.getHomeProducts();
      emit(GetHomeProductsSuccess(homeProducts));
    } catch (e) {
      emit(GetHomeProductsError(e.toString()));
    }
  }

  List<Product> categoryProducts = [];
  Future<void> getCategoryProducts(ProductsCategoriesEnum category) async {
    emit(GetCategoryProductsLoading());
    try {
      categoryProducts = await homeRepo.getProductsByCategory(category);
      print(categoryProducts);
      emit(GetCategoryProductsSuccess(categoryProducts));
    } catch (e) {
      print(e);
      emit(GetCategoryProductsError(e.toString()));
    }
  }
}
