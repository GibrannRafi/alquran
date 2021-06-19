
import 'package:flutter/material.dart';
import 'package:alquran/viewModel/listDetailSuratViewModel.dart';

class DetailAlquran extends StatefulWidget{
  final String nomor;
  final String nama;

  DetailAlquran({this.nomor,this.nama});
  @override
  _DetailAlquranState createState() => _DetailAlquranState();
}

class _DetailAlquranState extends State<DetailAlquran>{
  List detailAlquranJSON;

  void detailAyat(){
    ListDetailSuratViewModel().dataDetailAlquran(widget.nomor).then((value){
      setState(() {
        detailAlquranJSON = value;
      });
    });
  }  

  @override
  void initState() { 
    super.initState();
    detailAyat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nama),),
      body: detailAlquranJSON == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
        itemCount: detailAlquranJSON.length,
        itemBuilder: (context,i){
          return ListTile(
            title: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(detailAlquranJSON[i].ar),
                  Text(''),
                  Text(detailAlquranJSON[i].id),
                  Text('')
                ],
              )
            ),
          );
        },
      ),
    );
  }
}