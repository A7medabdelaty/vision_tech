part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeProductsLoading extends HomeState {}

final class GetHomeProductsSuccess extends HomeState {
  final List<Product> homeProducts;

  GetHomeProductsSuccess(this.homeProducts);
}

final class GetHomeProductsError extends HomeState {
  final String error;

  GetHomeProductsError(this.error);
}

final class GetCategoryProductsLoading extends HomeState {}

final class GetCategoryProductsSuccess extends HomeState {
  final List<Product> categoryProducts;

  GetCategoryProductsSuccess(this.categoryProducts);
}

final class GetCategoryProductsError extends HomeState {
  final String error;

  GetCategoryProductsError(this.error);
}
