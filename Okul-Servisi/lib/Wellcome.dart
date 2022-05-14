import 'package:deneme/edit.dart';
import 'package:deneme/main.dart';
import 'package:deneme/map.dart';
import 'package:flutter/material.dart';
List<Busa> busa = <Busa>[
  Busa(0, 'Basiskele'),
  Busa(1, 'Cayirova'),
  Busa(2, 'Darica'),
  Busa(3, 'Derince'),
  Busa(4, 'Dilovasi'),
  Busa(5, 'Gebze'),
  Busa(6, 'Golcuk'),
  Busa(7, 'Kandira'),
  Busa(8, 'Karamursel'),
  Busa(9, 'Kartepe'),
  Busa(10, 'Korfez'),
  Busa(11, 'Izmit'), //12
];

class Busa {
  int index;
  String sehir;
  Busa(this.index,this.sehir);
}

class Welcome extends StatefulWidget {
  final String isim;
  const Welcome({Key? key, required this.isim}) : super(key: key);
  @override
  State<Welcome> createState() => _WelcomeState(isim);
}
class _WelcomeState extends State<Welcome> {
  _WelcomeState(String isim);
  BusStationPersonNumber? selected;
  late BusStationPersonNumber stationPersonNumber;
  //otos.add(oto3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kullanıcı Sayfası'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                child: Text("back"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ElevatedButton(
                child: Text("Haritaları Aç"),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MapSample()));
                }),
            DropdownButton<BusStationPersonNumber>(
              icon: Icon(Icons.add_location_alt_outlined),
              dropdownColor: Colors.indigo,
              iconEnabledColor: Colors.green,
              hint: Text("Durak Seçiniz"),
              value: selected,
              onChanged: (BusStationPersonNumber? Value) {
                setState(() {
                  selected = Value!;
                  switch (selected?.stationName) {
                    case "Basiskele":
                      busa[0].index=-1;
                      StationName[0].ridership += 1;
                      break;
                    case "Cayirova":
                      busa[1].index=-1;
                      StationName[1].ridership += 1;
                      break;
                    case "Darica":
                      busa[2].index=-1;
                      StationName[2].ridership += 1;
                      break;
                    case "Derince":
                      busa[3].index=-1;
                      StationName[3].ridership += 1;
                      break;
                    case "Dilovasi":
                      busa[4].index=-1;
                      StationName[4].ridership += 1;
                      break;
                    case "Gebze":
                      busa[5].index=-1;
                      StationName[5].ridership += 1;
                      break;
                    case "Golcuk":
                      busa[6].index=-1;
                      StationName[6].ridership += 1;
                      break;
                    case "Kandira":
                      busa[7].index=-1;
                      StationName[7].ridership += 1;
                      break;
                    case "Karamursel":
                      busa[8].index=-1;
                      StationName[8].ridership += 1;
                      break;
                    case "Kartepe":
                      busa[9].index=-1;
                      StationName[9].ridership += 1;
                      break;
                    case "Korfez":
                      busa[10].index=-1;
                      StationName[10].ridership += 1;
                      break;
                    case "Izmit":
                      busa[11].index=-1;
                      StationName[11].ridership += 1;
                      break;
                  }
                });
              },
              items: StationName.map((BusStationPersonNumber stationname) {
                return DropdownMenuItem<BusStationPersonNumber>(
                  value: stationname,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${stationname.stationName}",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
