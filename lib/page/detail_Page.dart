import 'package:flutter/material.dart';

import '../Model/pieSolutionModel.dart';
import '../Model/pieSolutionModel.dart';
import '../Model/pieSolutionModel.dart';


class DetailPage extends StatelessWidget {
  final Categories categories;
  const DetailPage({Key key, this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Card(
        child: ListTile(
          title: Text(categories.emailAddress),
          subtitle: Text(categories.phoneNumber),
        ),
      )),
    );
  }
}
