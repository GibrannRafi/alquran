import 'package:flutter/material.dart';
import 'detailAlquran.dart';
import 'package:alquran/viewModel/listSuratViewModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Al-Qur'an Online",
    home: MyApp (),
  ));
}

// // ignore: must_be_immutable
// class Locationnow extends StatefulWidget {
//   @override
//   _LocationnowState createState() => _LocationnowState();
// }

// class _LocationnowState extends State<Locationnow> {
//   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   String kota;
//   Position datatempat;
//   void getPosition() async{
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     print(position);

//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: "id");
//     print(placemarks.first.subAdministrativeArea);

//     setState(() {
//       datatempat = position;
//       kota = placemarks.first.subAdministrativeArea;
//     });
//   }

//   Future ambilData() async{
//   http.Response hasil = await http.get(
//     Uri.encodeFull('https://api.pray.zone/v2/times/day.json?city=${kota}&date=${today}'),
//     headers: {"Accept":"application/json"}
//   );

//   // print(json.encode(hasil.body));
//   Map<String, dynamic> map = json.decode(hasil.body);
//   print(map['results']['datetime'][0]['times']);
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Lokasi Sekarang')),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Posisi Muncul'),
//           onPressed: (){
//             getPosition();
//           },
//         )
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
// class Datenow extends StatelessWidget {
//   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Waktu Sekarang')
//       ),
//       body: Container(
//         child: Center(
//           child: Text(today),
//         )
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _AlQuranState createState() => _AlQuranState();
}

class _AlQuranState extends State<MyApp> {
  List dataDariJSON;

  void listSurat() {
    ListSuratViewModel().ambilData().then((value) {
      setState(() {
        dataDariJSON = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    listSurat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Al-Quran')),
      body: dataDariJSON == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataDariJSON.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(dataDariJSON[i].nama),
                  subtitle: Text(
                      "${dataDariJSON[i].type} | ${dataDariJSON[i].ayat} ayat"),
                  trailing: Text(dataDariJSON[i].asma),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailAlquran(
                          nomor: dataDariJSON[i].nomor,
                          nama: dataDariJSON[i].nama);
                    }));
                  },
                );
              },
            ),
    );
  }
}
