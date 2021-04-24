import 'package:flutter/material.dart';
import 'package:pie_solution/page/detail_Page.dart';
import 'package:pie_solution/service/pieService.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<PieService>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpperCut(),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: pro.persistData, child: Text('Persist Data')),
                TextButton(
                    onPressed: () {
                      pro.loadData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MiddleCut()));
                    },
                    child: Text('Load Data')),
                OutlinedButton(
                    onPressed: pro.clearData, child: Text('Clear Data')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleCut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<PieService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('local Data'),
      ),
      body: ListView(
        children: pro.persisList
            .map((e) => Card(
                  child: ListTile(
                    tileColor: Colors.blueGrey,
                    title: Text(e['name']),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class UpperCut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<PieService>(context);

    return pro.listCat.isNotEmpty
        ? AspectRatio(
            aspectRatio: 3 / 3,
            child: Container(
              child: ListView(
                children: pro.listCat
                    .map(
                      (list) => Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(categories: list,) ));
                          },
                          leading: IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.red,
                            onPressed: () {
                              pro.deleteData(list);
                            },
                          ),
                          tileColor: Colors.orange[50],
                          title: Text(list.name),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        : pro.listCat == null
            ? Center(
                child: Column(
                  children: [
                    Text('SomeThing Went Wrong'),
                    Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                  ],
                ),
              )
            : Center(
                child: Text("List is Empty"),
              );
  }
}


