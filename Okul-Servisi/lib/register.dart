import 'dart:convert';
import 'package:deneme/ekran.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'ekran.dart';
import 'ekran2.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future register() async {
    var response = await http
        .post(Uri.parse('http://192.168.183.66/login/register.php'), body: {
      'name': user.text,
      'password': pass.text,
    });
    var data = json.decode(json.encode(response.body));
    List <String> result= data.toString().split('');
    if (result[1]=='E') {
      Fluttertoast.showToast(
          msg: "Kullanıcı Çoktan Kayıt Oldu",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Kullanıcı Başarılı şekilde kayıt oldu",
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
                  padding: EdgeInsets.only(right: 20,left: 60,bottom: 10),
                  width: 400.0,
                  child: Text(
                    "Kullanıcı",style: TextStyle(
                      fontSize: 65,
                      color: Colors.blueAccent
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20,left: 20,bottom: 40),
                  width: 400.0,
                  child: Text(
                    "Kayıt Ekranı",style: TextStyle(
                      fontSize: 55,
                      fontFamily: 'RobotoMono'
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
                
                RaisedButton(
                    child: Text("Kayıt Ol"),
                    onPressed: () {
                      register();
                    }),
                MaterialButton(
                    child: Text("Zaten Üyeyim"),
                    onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ),
                  );
                },
                    ),
              ],
            )),
      ),
    );
  }
}
