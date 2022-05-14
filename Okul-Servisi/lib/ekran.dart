import 'package:deneme/register.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'register.dart';
import 'Wellcome.dart';

class Kullanici {
  String isim = "";
  Kullanici(this.isim);
}
class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var response =
        await http.post(Uri.parse('http://.../login/login.php'), body: {
      'name': user.text,
      'password': pass.text,
    });
    var data = json.decode(json.encode(response.body));
    List<String> result = data.toString().split('');
    if (result[1] == 'S') {
      Fluttertoast.showToast(
          msg: "Hoşgeldiniz",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Welcome(
                    isim: user.text,
                  )));
    } else {
      Fluttertoast.showToast(
          msg: "Kullanıcı Adı veya Şifre Hatalı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20, left: 60, bottom: 10),
                  width: 400.0,
                  child: Text(
                    "Kullanıcı",
                    style: TextStyle(fontSize: 65, color: Colors.blueAccent),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20, left: 20, bottom: 40),
                  width: 400.0,
                  child: Text(
                    "Giriş Ekranı",
                    style: TextStyle(
                      fontSize: 65,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  controller: user,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  controller: pass,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      child: Text("Üye Ol"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                RaisedButton(
                    child: Text("Giriş"),
                    onPressed: () {
                      login();
                    }),
              ],
            )),
      ),
    );
  }
}
