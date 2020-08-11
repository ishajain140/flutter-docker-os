import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MyTechApp());
}

web(osname, imagename) async {
  var url = "http://192.168.99.105/cgi-bin/web.py?x=${osname}&y=${imagename}";
  var response = await http.get(url);
  print(response.body);
}

toast(){
  
    Fluttertoast.showToast(
        msg: "Launching OS",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black12,
        textColor: Colors.white,
        fontSize: 16.0);
  }

class MyTechApp extends StatelessWidget {
  String osname;
  String imagename;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('Docker App',
          textDirection: TextDirection.ltr,
          ),
          centerTitle: true
                 ),
        body: Center(
          child: Container(
            width: 300,
            height: 350,
            color: Colors.grey.shade300,
             padding: EdgeInsets.all(50),
              
              
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text ("fisrt"), 
                //Text ("sec"),
                TextField(
                  onChanged: (value) {
                    osname = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Docker OS name",
                    prefixIcon: Icon(Icons.input),
                    ),
                ),
                TextField(
                  onChanged: (value) {
                    imagename = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Image name",
                    prefixIcon: Icon(Icons.input),
                  ),
                ),
                RaisedButton(color: Colors.grey[200],
                    onPressed: () {
                      web(osname, imagename);
                      toast();
                      print(osname);

                    },
                    child: Text('click '),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
