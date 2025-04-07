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

    List<Map<String, dynamic>> jsonData = await jsonHelper.readJsonFromFile(
      path: 'assets/products/finger_print/finger_print_products.json',
    );
    jsonData.map((item) => homeProducts.add(Product.fromJson(item)));

    jsonData = await jsonHelper.readJsonFromFile(
      path: 'assets/products/security_cam/security_cam_products.json',
    );
    jsonData.map((item) => homeProducts.add(Product.fromJson(item)));

    jsonData = await jsonHelper.readJsonFromFile(
      path: 'assets/products/storage_devices/storage_devices_products.json',
    );
    jsonData.map((item) => homeProducts.add(Product.fromJson(item)));

    homeProducts.shuffle();

    return homeProducts;
  }

  @override
  Future<List<Product>> getProductsByCategory(category) async {
    switch (category) {
      case ProductsCategoriesEnum.fingerPrint:
        List<Map<String, dynamic>> jsonData = await jsonHelper.readJsonFromFile(
          path: 'assets/products/finger_print/finger_print_products.json',
        );
        return jsonData.map((item) => Product.fromJson(item)).toList();
      case ProductsCategoriesEnum.securityCameras:
        List<Map<String, dynamic>> jsonData = await jsonHelper.readJsonFromFile(
          path: 'assets/products/security_cam/security_cam_products.json',
        );
        return jsonData.map((item) => Product.fromJson(item)).toList();
      case ProductsCategoriesEnum.storageDevices:
        List<Map<String, dynamic>> jsonData = await jsonHelper.readJsonFromFile(
          path: 'assets/products/storage_devices/storage_devices_products.json',
        );
        return jsonData.map((item) => Product.fromJson(item)).toList();
    }
  }
}
