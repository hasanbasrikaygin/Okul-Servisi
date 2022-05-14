import 'package:deneme/ekran.dart';
import 'package:flutter/material.dart';
import 'ekran2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20, left: 20, top: 60),
              child: Text(
                "Kocaeli Üniversitesi",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 40),
              child: Text(
                "Ulaşım Uygulaması",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 43,
                ),
              ),
            ),
            Container(
              child: Image(
                image: AssetImage('assets/images/kou.jpg'),
                width: 300,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  elevation: 5,
                  textStyle: TextStyle(
                    fontSize: 40,
                  ),
                ),
                child: Text("Admin Giriş"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => aloginpage(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 5,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
                child: Text(
                  "Kullanıcı Girişi",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

