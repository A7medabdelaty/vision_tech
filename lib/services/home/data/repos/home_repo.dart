import '../categories_enum.dart';
import '../product_model.dart';

abstract class HomeRepo {
  Future<List<Product>> getHomeProducts();

  Future<List<Product>> getProductsByCategory(ProductsCategoriesEnum category);
}
