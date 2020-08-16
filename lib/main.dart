import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
String x;

String osname;
String imagename;
String version;

web(osname,imagename,version) async {
  var url = 'http://192.168.29.137/cgi-bin/web.py?x=${osname}&y=${imagename}&z=${version}';

  var response = await http.get(url);
  print(response.body);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DOCKER APP'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.grey.shade300,
            child: Center(
              child: Column(
                children: [
                  TextField(
                    onChanged: (val) {
                      osname = val;
                    },
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.arrow_forward_ios),
                      hintText: "Enter your OS name",
                    ),
                  ),
                  TextField(
                    onChanged: (val) {
                      imagename = val;
                    },
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.crop_5_4),
                      hintText: "Enter your Image name",
                    ),
                  ),
                  TextField(
                    onChanged: (val) {
                      version = val;
                    },
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.tonality),
                      hintText: "Enter your version name",
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      web(osname,imagename,version);
                    },
                    child: Text('Click here to execute your command'),
                    color: Colors.red.shade300,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
