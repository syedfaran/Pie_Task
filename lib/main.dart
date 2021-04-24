import 'package:flutter/material.dart';
import 'package:pie_solution/myApp.dart';
import 'package:pie_solution/service/pieService.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => PieService(),
    child: MyApp(),
  ));
}
