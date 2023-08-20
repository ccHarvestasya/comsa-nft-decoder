import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Https {
  /// REST URL
  final String url;

  /// REST パス
  final String path;

  /// コンストラクタ
  Https({required this.url, required this.path});

  /// Https Get取得<br>
  /// [params] Getパラメータ<br>
  Future<dynamic> get(Map<String, dynamic>? params) async {
    dynamic jsonData = [];

    Uri uri = Uri();
    try {
      uri = Uri.https(url, path, params);
      debugPrint('URL: ${uri.toString()}');
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        // 取得成功
        jsonData = convert.jsonDecode(response.body);
      } else {
        // 取得失敗
        String msg = 'request failed.\n';
        msg += 'URL(GET): $uri\n';
        msg += 'Status: ${response.statusCode}\n';
        throw HttpException(msg);
      }
    } on HttpException {
      rethrow;
    } on Exception {
      String msg = 'access failed.\n';
      msg += 'URL: $uri\n';
      throw Exception(msg);
    }

    return jsonData;
  }

  /// Https Post取得<br>
  /// [body] Postボディ<br>
  Future<dynamic> post(String body) async {
    dynamic jsonData = [];

    Uri uri = Uri();
    try {
      uri = Uri.https(url, path);
      Map<String, String> headers = {'content-type': 'application/json'};

      http.Response response =
          await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 200) {
        // 取得成功
        jsonData = convert.jsonDecode(response.body);
      } else {
        // 取得失敗
        String msg = 'request failed.\n';
        msg += 'URL: $uri\n';
        msg += 'Status: ${response.statusCode}\n';
        throw HttpException(msg);
      }
    } on HttpException {
      rethrow;
    } on Exception {
      String msg = 'access failed.\n';
      msg += 'URL: $uri\n';
      throw Exception(msg);
    }

    return jsonData;
  }
}