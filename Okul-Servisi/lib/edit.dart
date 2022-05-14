import 'dart:convert';
import 'Wellcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
List<BusStationPersonNumber> StationName = <BusStationPersonNumber>[
  BusStationPersonNumber(0, 'Basiskele'),
  BusStationPersonNumber(0, 'Cayirova'),
  BusStationPersonNumber(0, 'Darica'),
  BusStationPersonNumber(0, 'Derince'),
  BusStationPersonNumber(0, 'Dilovasi'),
  BusStationPersonNumber(0, 'Gebze'),
  BusStationPersonNumber(0, 'Golcuk'),
  BusStationPersonNumber(0, 'Kandira'),
  BusStationPersonNumber(0, 'Karamursel'),
  BusStationPersonNumber(0, 'Kartepe'),
  BusStationPersonNumber(0, 'Korfez'),
  BusStationPersonNumber(0, 'Izmit'),//12
];
class BusStationPersonNumber {
  int ridership = 0;
  String stationName = "";
  BusStationPersonNumber(this.ridership, this.stationName);
}
class BusType {
  int busLoad25 = 0;
  int busLoad30 = 0;
  int busLoad40 = 0;

  BusType(this.busLoad25, this.busLoad30, this.busLoad40);
}
class edit extends StatefulWidget {
  String isim = "";
  edit(this.isim);

  @override
  State<edit> createState() => _nameState();
}

class _nameState extends State<edit> {
    List<BusType> bus = <BusType>[BusType(1, 1, 1)];
  TextEditingController busload25 = TextEditingController();
  TextEditingController busload30 = TextEditingController();
  TextEditingController busload40 = TextEditingController();

  TextEditingController TecBasiskele = TextEditingController();
  TextEditingController TecCayirova = TextEditingController();
  TextEditingController TecDarica = TextEditingController();
  TextEditingController TecDerince = TextEditingController();
  TextEditingController TecDilovasi = TextEditingController();
  TextEditingController TecGebze = TextEditingController();
  TextEditingController TecGolcuk = TextEditingController();
  TextEditingController TecKandira = TextEditingController();
  TextEditingController TecKaramursel = TextEditingController();
  TextEditingController TecKorfez = TextEditingController();
  TextEditingController TecKartepe = TextEditingController();
  TextEditingController TecIzmit = TextEditingController(); //12
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Sayfası'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Otobüs Seçimi',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(offset: Offset(0, -20), color: Colors.black)
                          ],
                          decorationThickness: 4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, right: 15, left: 15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: busload25,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '25 koltuklu',
                        hintText: 'Otobüs sayısı',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ], //sadece rakam kullanimina izin verir
                      controller: busload30,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '30 koltuklu',
                        hintText: 'Otobüs sayısı',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: busload40,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '40 koltuklu',
                        hintText: 'Otobüs Sayısı',
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5), child: Text('')),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Duraklardan Binecek Yolcu Sayısını Belirleme',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(offset: Offset(0, -20), color: Colors.black)
                          ],
                          decorationThickness: 4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecBasiskele,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Başiskele',
                        hintText: 'Başiskele',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecDarica,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Darıca',
                        hintText: 'Darıca',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecDerince,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Derince',
                        hintText: 'Derince',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecDilovasi,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Dilovası',
                        hintText: 'Dilovası',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecGebze,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gebze',
                        hintText: 'Gebze',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecGolcuk,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gölcük',
                        hintText: 'Gölcük',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecKandira,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kandıra',
                        hintText: 'Kandıra',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecKaramursel,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Karamürsel',
                        hintText: 'Karamürsel',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecCayirova,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Çayırova',
                        hintText: 'Çayırova',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecKartepe,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kartepe',
                        hintText: 'Kartepe',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecKorfez,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Körfez',
                        hintText: 'Körfez',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: TecIzmit,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'İzmit',
                        hintText: 'İzmit',
                      ),
                    ),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Devam'),
                    onPressed: () {
                      bus[0].busLoad25 += int.parse(busload25.text);
                      bus[0].busLoad30 += int.parse(busload30.text);
                      bus[0].busLoad40 += int.parse(busload40.text);

                      StationName[0].ridership += int.parse(TecBasiskele.text);
                      StationName[1].ridership += int.parse(TecCayirova.text);
                      StationName[2].ridership += int.parse(TecDarica.text);
                      StationName[3].ridership += int.parse(TecDerince.text);
                      StationName[4].ridership += int.parse(TecDilovasi.text);
                      StationName[5].ridership += int.parse(TecGebze.text);
                      StationName[6].ridership += int.parse(TecGolcuk.text);
                      StationName[7].ridership += int.parse(TecKandira.text);
                      StationName[8].ridership += int.parse(TecKaramursel.text);
                      StationName[9].ridership += int.parse(TecKartepe.text);
                      StationName[10].ridership += int.parse(TecKorfez.text);
                      StationName[11].ridership += int.parse(TecIzmit.text);

                      print(
                          "25 :${bus[0].busLoad25}  30 :${bus[0].busLoad30} 40 :${bus[0].busLoad40}  ");
                      print("0: ${StationName[0].ridership}\t"
                          "1: ${StationName[1].ridership}\t"
                          "2: ${StationName[2].ridership}\t"
                          "3: ${StationName[3].ridership}\t"
                          "4: ${StationName[4].ridership}\t"
                          "5: ${StationName[5].ridership}\t"
                          "6: ${StationName[6].ridership}\t"
                          "7: ${StationName[7].ridership}\t"
                          "8: ${StationName[8].ridership}\t"
                          "9: ${StationName[9].ridership}\t"
                          "10: ${StationName[10].ridership}\t"
                          "11: ${StationName[11].ridership}");
                    },
                  ),
                ],
              ),
            )));
  }
}


