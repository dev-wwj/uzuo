import 'dart:convert';

import 'package:flutter/services.dart';

extension WMap on Map {
  Map fromJson(String json) {
    return jsonDecode(json);
  }

  static Future<Map> readJsonFile(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = json.decode(response);
    return data;
  }
}
