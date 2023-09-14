import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trips/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response resp = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (resp.statusCode == 200) {
        List<dynamic> list = json.decode(resp.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
