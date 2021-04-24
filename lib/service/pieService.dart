import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_solution/Model/pieSolutionModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/pieSolutionModel.dart';

class PieService with ChangeNotifier {
  PieService() {
    fetchData();
  }

  static const String _api = 'https://pietest.dev.new.wf/data.json';
  List<Categories> _list = [];
  List<Categories> get listCat => _list;
  //persist list
  List _persist =[];
  List<dynamic> get persisList =>_persist;

  Future<void> fetchData() async {
    http.Response response = await http.post(_api);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      _list = PieSolution.fromJson(json).categories;
      notifyListeners();
    } else {
      _list = null;
      notifyListeners();
    }
  }

  void deleteData(Categories cat) {
    _list.remove(cat);
    notifyListeners();
  }

  void  loadData() async {
    final prefs = await SharedPreferences.getInstance();

    var gg = prefs.getString('lol');
    if(gg==null){
      _persist = [];
    }else {
      List<dynamic> ff = jsonDecode(gg);
      _persist = ff;
    }
  }

  void persistData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lol', jsonEncode(_list));

  }

  void clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print(prefs.getString('lol'));
  }
}
