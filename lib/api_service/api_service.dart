import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task_wits_innovation_lab/models/product.dart';

class ApiService {

  static Future<List<Product>> getProducts() async {

    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }

  }
}
