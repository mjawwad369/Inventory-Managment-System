import 'dart:convert';
import 'dart:io';
import '../project/product.dart';

class InventoryService {
  final String dataFile = 'data/products.json';

  Future<List<product>> loadProduct() async {
    final file = File(dataFile);
    if (!file.existsSync()) {
      await file.writeAsString('[]');
    }
    final jsonData = jsonDecode(await file.readAsStringSync()) as List;
    return jsonData.map((p) => product.fromJson(p)).toList();
  }

  Future<void> saveProducts(List<product> products) async {
    final file = File(dataFile);
    final jsonStr = jsonEncode(products.map((p) => p.toJson()).toList());
    await file.writeAsString(jsonStr);
  }
}
