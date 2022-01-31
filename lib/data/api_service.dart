import 'dart:convert';

import 'package:testfokatech/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final _baseUrl = "https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373";

  Future<List<Product>> listProduct() async {
    var url = Uri.parse(_baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("succes get product");

      List listObjJson = json.decode(response.body) as List;
      List<Product> productList =
          listObjJson.map((product) => Product.fromJson(product)).toList();

      print("cek length ${productList.length}");

      return productList;
    } else {
      print("failed get resto");
      throw Exception("Failed to load produk!");
    }
  }
}
