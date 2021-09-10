import 'package:dio/dio.dart';

class ContacsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8081/'));

  Future<List> getContacts() async {
    final response = await _dio.get(' ');
    return response.data['contacts'];
    /*.map<Contact>((json) => Contact.fromJson(json))
        .toList();*/
  }

  /*Future<Contact> createContact(String name) async {
    final response = await _dio.post('', data: {'name': name});
    return Contact.fromJson(response.data);
  }

  Future deleteContact(String id) async {
    final response = await _dio.delete('/$id');
    return response.data;
  }*/
}
