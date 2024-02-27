import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/name_mode.dart';
import 'package:untitled/widgets/Colors.dart';

class NameDetails extends StatelessWidget {
  final Name data;
  final int currentIndex;
  final List<Name> allNames;

  const NameDetails({required this.data, required this.currentIndex, required this.allNames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${data.name}',
                style: TextStyle(fontSize: 30, color: primaryColor),
              ),
              SizedBox(height: 10),
              Text(
                'English Name: ${data.nameEn}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Meaning: ${data.meaning}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Description:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                // padding: EdgeInsetsGeometryTween(begin: 5, end: 5) ,
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 5, 5),
                child: Text(
                  data.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200, // Adjust width as needed
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor2.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,2), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Image.asset(
                        'assets/ram2.png', // Replace 'row.png' with your image asset path
                        width: 200, // Adjust width as needed
                        height: 200, // Adjust height as needed
                      ),
                    ),
                    Positioned.fill(
                      child: ClipOval(
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentIndex > 0)
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NameDetails(data: allNames[currentIndex - 1], currentIndex: currentIndex - 1, allNames: allNames)),
                );
              },
              child: Icon(Icons.arrow_back),
            ),
          if (currentIndex < allNames.length - 1)
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NameDetails(data: allNames[currentIndex + 1], currentIndex: currentIndex + 1, allNames: allNames)),
                );
              },
              child: Icon(Icons.arrow_forward),
            ),
        ],
      ),
    );
  }
}
