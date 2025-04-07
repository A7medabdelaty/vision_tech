import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
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
      print(homeProducts);
      emit(GetHomeProductsSuccess(homeProducts));
    } catch (e) {
      print(e);
      emit(GetHomeProductsError(e.toString()));
    }
  }
}
