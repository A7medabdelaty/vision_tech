import 'package:vision_tech/core/json_helper.dart';
import 'package:vision_tech/services/home/data/product_model.dart';
import 'package:vision_tech/services/home/data/repos/home_repo.dart';

import '../categories_enum.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.jsonHelper);

  final JsonHelper jsonHelper;

  @override
  Future<List<Product>> getHomeProducts() async {
    List<Product> homeProducts = [];

    List<dynamic> jsonData = await jsonHelper.loadJsonFromFile(
      path: 'assets/products/finger_print/finger_print_products.json',
    );
    for (var jsonItem in jsonData) {
      try {
        final product = Product.fromJson(jsonItem);
        homeProducts.add(product);
      } catch (e) {
        throw (e.toString());
      }
    } //
    jsonData = await jsonHelper.loadJsonFromFile(
      path: 'assets/products/security_cam/security_cam_products.json',
    );
    for (var jsonItem in jsonData) {
      try {
        final product = Product.fromJson(jsonItem);
        homeProducts.add(product);
      } catch (e) {
        throw (e.toString());
      }
    }
    jsonData = await jsonHelper.loadJsonFromFile(
      path: 'assets/products/storage_devices/storage_devices_products.json',
    );
    for (var jsonItem in jsonData) {
      try {
        final product = Product.fromJson(jsonItem);
        homeProducts.add(product);
      } catch (e) {
        throw (e.toString());
      }
    }
    homeProducts.shuffle();

    return homeProducts;
  }

  @override
  Future<List<Product>> getProductsByCategory(category) async {
    List<Product> categoryProducts = [];
    switch (category) {
      case ProductsCategoriesEnum.fingerPrint:
        List<dynamic> jsonData = await jsonHelper.loadJsonFromFile(
          path: 'assets/products/finger_print/finger_print_products.json',
        );
        for (var jsonItem in jsonData) {
          try {
            final product = Product.fromJson(jsonItem);
            categoryProducts.add(product);
          } catch (e) {
            throw (e.toString());
          }
        }
        return categoryProducts;
      case ProductsCategoriesEnum.securityCameras:
        List<dynamic> jsonData = await jsonHelper.loadJsonFromFile(
          path: 'assets/products/security_cam/security_cam_products.json',
        );
        for (var jsonItem in jsonData) {
          try {
            final product = Product.fromJson(jsonItem);
            categoryProducts.add(product);
          } catch (e) {
            throw (e.toString());
          }
        }
        return categoryProducts;
      case ProductsCategoriesEnum.storageDevices:
        List<dynamic> jsonData = await jsonHelper.loadJsonFromFile(
          path: 'assets/products/storage_devices/storage_devices_products.json',
        );
        for (var jsonItem in jsonData) {
          try {
            final product = Product.fromJson(jsonItem);
            categoryProducts.add(product);
          } catch (e) {
            throw (e.toString());
          }
        }
        return categoryProducts;
    }
  }
}
