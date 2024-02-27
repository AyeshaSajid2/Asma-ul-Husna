import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/data/data.dart';
import 'package:untitled/models/name_mode.dart';
import 'package:untitled/name_details.dart';
import 'package:untitled/widgets/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Name> names = [];
  var data = json.decode(jsonData);

  @override
  void initState() {
    super.initState();
    names = List.generate(
      data.length,
          (index) => Name(
        data[index][1],
        data[index][2],
        data[index][3],
        data[index][4],
        data[index][5],
        data[index][6],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('99 Names of Allah'),
        backgroundColor: primaryColor,
        centerTitle: true,
        primary: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          children: List.generate(
            names.length,
                (index) {
              return getStructuredGridCell(context, names[index], names);
            },
          ),
        ),
      ),
    );
  }
}

Card getStructuredGridCell(BuildContext context, Name name, List<Name> allNames) {
  return Card(
    elevation: 5,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NameDetails(
              data: name,
              currentIndex: allNames.indexOf(name),
              allNames: allNames,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Text(
            name.name.replaceAll("'", ""),
            style: TextStyle(fontSize: 30.0),
          ),
          Text(
            name.nameEn,
            style: TextStyle(fontSize: 26.0),
          ),
          Text(
            name.meaning,
          ),
        ],
      ),
    ),
  );
}
