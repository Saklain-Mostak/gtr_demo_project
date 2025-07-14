import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:gtr_task/src/core/api/api_path.dart';
import 'package:gtr_task/src/features/models/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerApiService {
  

  static Future<CustomerModel> fetchcategories(
    int pageNo,
    int pageSize,
    String sortedBy,
  ) async {
    final url = Uri.parse(
     
      "${ApiPath.customerList}&pageNo=$pageNo&pageSize=$pageSize&SortyBy=$sortedBy",
    );
    final box = GetStorage();
    final token = box.read('token');
    final response = await http.get(
      url,

      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // print("============**************=========== $jsonResponse");

      return CustomerModel.fromJson(jsonResponse);
    } else {
      throw Exception("Faild to load categories");
    }
  }
}
