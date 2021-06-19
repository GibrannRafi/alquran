// To parse this JSON data, do
//
//     final listDetailSuratModel = listDetailSuratModelFromJson(jsonString);

import 'dart:convert';

List<ListDetailSuratModel> listDetailSuratModelFromJson(String str) => List<ListDetailSuratModel>.from(json.decode(str).map((x) => ListDetailSuratModel.fromJson(x)));

String listDetailSuratModelToJson(List<ListDetailSuratModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListDetailSuratModel {
    ListDetailSuratModel({
        this.ar,
        this.id,
        this.nomor,
        this.tr,
    });

    String ar;
    String id;
    String nomor;
    String tr;

    factory ListDetailSuratModel.fromJson(Map<String, dynamic> json) => ListDetailSuratModel(
        ar: json["ar"],
        id: json["id"],
        nomor: json["nomor"],
        tr: json["tr"],
    );

    Map<String, dynamic> toJson() => {
        "ar": ar,
        "id": id,
        "nomor": nomor,
        "tr": tr,
    };
}
