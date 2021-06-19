import 'package:alquran/model/listDetailSuratModel.dart';
import 'package:http/http.dart' as http;

class ListDetailSuratViewModel {

  Future<List> dataDetailAlquran(String nomor) async{
    try{
    http.Response hasilDetail = await http.get(
      Uri.encodeFull('https://al-quran-8d642.firebaseio.com/surat/$nomor.json?print=pretty'),
      headers:{'Accept':'application.json'}
    );
    if(hasilDetail.statusCode == 200){
        print('Data List Surat Berhasil');
        final data = listDetailSuratModelFromJson(hasilDetail.body);
        return data;
      }else{
        print('Error Status '+ hasilDetail.statusCode.toString());
        return null;
      }
    } catch (e) {
      print('Error Catch $e');
      return null;
    }
  }
}