import 'dart:convert';
import 'package:manajementugas/helpers/api_url.dart';
import 'package:manajementugas/helpers/api.dart';
import 'package:manajementugas/model/tugas.dart';

class TugasBloc {
  static Future<List<Tugas>> getTugass() async {
    String apiUrl = ApiUrl.listTugas;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTugas = (jsonObj as Map<String, dynamic>)['data'];
    List<Tugas> tugass = [];
    for (int i = 0; i < listTugas.length; i++) {
      tugass.add(Tugas.fromJson(listTugas[i]));
    }
    return tugass;
  }

  static Future addTugas({Tugas? tugas}) async {
    String apiUrl = ApiUrl.createTugas;
    var body = {
      "title": tugas!.title,
      "description": tugas.description,
      "deadline": tugas.deadline.toString()
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateTugas({required Tugas tugas}) async {
    String apiUrl = ApiUrl.updateTugas(tugas.id!);
    var body = {
      "title": tugas.title,
      "description": tugas.description,
      "deadline": tugas.deadline.toString()
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteTugas({int? id}) async {
    String apiUrl = ApiUrl.deleteTugas(id!);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
