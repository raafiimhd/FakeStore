import 'dart:convert';

import 'package:fake_store_api/core/api/api_url.dart';
import 'package:fake_store_api/model/model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<FakeStore>> getall() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as List;
      return responseData.map((data) => FakeStore.fromJson(data)).toList();
    } else {
      throw Exception('Error');
    }
  }

  Future<void> postData() async {
    final response = await http.post(
      Uri.parse(api),
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Post Successfull (statusCode : ${response.statusCode})');
    } else {
      throw Exception('Error');
    }
  }

  Future<void> deleteData(int id) async {
    final response = await http.delete(Uri.parse('$api/$id'));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('DELETE Successful (statusCode: ${response.statusCode})');
    } else {
      throw Exception('Error');
    }
  }

  Future<void> putData({required FakeStore product}) async {
    final response = await http.put(Uri.parse(patchApi), body: {
      'title': 'test product',
      'price': 13.5.toString(),
      'description': 'lorem ipsum set',
      'image': 'https://i.pravatar.cc',
      'category': 'electronic'
    });
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('PUT Successful (statuscode : ${response.statusCode})');
    } else {
      throw Exception('Error');
    }
  }

  Future<void> patchData({required FakeStore product}) async {
    final response = await http.patch(Uri.parse(patchApi), body: {
      'title': 'test product',
      'price': 13.5.toString(),
      'description': 'lorem ipsum set',
      'image': 'https://i.pravatar.cc',
      'category': 'electronic'
    });
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('PATCH Successful (statusCode: ${response.statusCode})');
    } else {
      throw Exception('Error');
    }
  }
}
