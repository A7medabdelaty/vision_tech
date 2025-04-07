part of 'home_cubit.dart';

@immutable
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
