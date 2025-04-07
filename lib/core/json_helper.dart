import 'dart:convert';

import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<Map<String, dynamic>>> readJsonFromFile({
    required String path,
  }) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString);
  }
}
