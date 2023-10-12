import 'package:flutter/material.dart';
import 'package:siap/models/mlogin.dart';
import 'package:siap/models/mlokasi.dart';
import 'package:siap/models/model.dart';
import 'package:http/http.dart' show Client;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:siap/models/mpersonal.dart';

class SiapApiService {
  Client client = Client();
  static const String url = "http://192.168.32.1/apisiap/public/";

  Future<LoginModel?> login(String pid, String pass) async {
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };
      final respond = await client.post(Uri.parse("$url/otentikasi/login"),
          headers: header, body: json.encode({"pid": pid, "pass": pass}));
      if (respond.statusCode == 200) {
        return LoginModel.fromJson(json.decode(respond.body));
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Terjadi Kesalahan Koneksi Ke Server, Mungkin dia Lelah...!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return null;
  }

  Future<Onesend?> getOnesend(String token) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      var respond =
          await client.get(Uri.parse("$url/onesend"), headers: header);
      if (respond.statusCode == 200) {
        final data = onesendFromJson(respond.body);

        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Terjadi Kesalahan Koneksi Ke Server, Mungkin dia Lelah...!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return null;
  }

  // Future<List<Teknisi>> getTeknisi(
  //     String gedung, String kodebagian, String token) async {
  //   Map<String, String> header = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   var respond = await client
  //       .get(Uri.parse("$url/teknisi/$gedung/$kodebagian"), headers: header);
  //   if (respond.statusCode == 200) {
  //     var jsonData = jsonDecode(respond.body);
  //     var jsonArray = jsonData['data'];
  //     List<Teknisi> listteknisi = [];
  //     for (var data in jsonArray) {
  //       Teknisi teknisi =
  //           Teknisi(nama: data['nama'], hp: data['hp'], pid: data['pid']);
  //       listteknisi.add(teknisi);
  //     }
  //     return listteknisi;
  //   }
  //   return [];
  // }

  Future<List<ModelPersonal>> getTeknisi(
      String gedung, String kodebagian, String token) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final respond = await client
        .get(Uri.parse("$url/teknisi/$gedung/$kodebagian"), headers: header);
    if (respond.statusCode == 200) {
      List<dynamic> body = json.decode(respond.body);
      List<ModelPersonal> list =
          body.map((dynamic item) => ModelPersonal.fromJson(item)).toList();
      return list;
    } else {
      throw 'Error get Lokasi';
    }
  }

  // Future<List<Personal>> getPersonal(String gedung, String statusstaf) async {
  //   var respond =
  //       await client.get(Uri.parse("$url/personal/$gedung/$statusstaf"));
  //   if (respond.statusCode == 200) {
  //     var jsonData = jsonDecode(respond.body);
  //     var jsonArray = jsonData['data'];
  //     List<Personal> listpersonal = [];
  //     for (var data in jsonArray) {
  //       Personal personal = Personal(
  //           pid: data['pid'], nama: data['nama'], gedung: data['gedung']);
  //       listpersonal.add(personal);
  //     }
  //     return listpersonal;
  //   }
  //   return [];
  // }

  // Future<List<Lokasi>> getLokasi(String gedung, String token) async {
  //   Map<String, String> header = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   try {
  //     var respond =
  //         await client.get(Uri.parse("$url/lokasi/$gedung"), headers: header);
  //     if (respond.statusCode == 200) {
  //       var jsonData = json.decode(respond.body);
  //       var jsonArray = jsonData['data'];
  //       List<Lokasi> listlokasi = [];
  //       for (var data in jsonArray) {
  //         Lokasi lokasi = Lokasi(
  //           nama: data['nama'],
  //         );
  //         listlokasi.add(lokasi);
  //       }
  //       return listlokasi;
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: 'Error $e',
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //     );
  //   }
  //   return [];
  // }

  Future<bool> kirimticket(
      String kodebarang,
      String namabarang,
      String keluhan,
      String lokasi,
      String gedung,
      String pengirim,
      String teknisi,
      String statuskirim) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final respond = await client.post(Uri.parse("$url/kirimtiket"),
          headers: header,
          body: json.encode({
            "kodebarang": kodebarang,
            "namabarang": namabarang,
            "keluhan": keluhan,
            "lokasi": lokasi,
            "gedung": gedung,
            "pengirim": pengirim,
            "teknisi": teknisi,
            "statuskirim": statuskirim
          }));
      if (respond.statusCode == 200) {
        return true;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return false;
  }

  Future<List<Tiket?>> getTiket(String gedung) async {
    try {
      var respond = await client.get(Uri.parse("$url/tiket/$gedung"));
      if (respond.statusCode == 200) {
        var jsonData = json.decode(respond.body);
        var jsonArray = jsonData['data'];
        List<Tiket> listtiket = [];
        for (var data in jsonArray) {
          Tiket tiket = Tiket(
              notiket: data["notiket"],
              tgl: data["tgl"],
              kodebarang: data["kodebarang"],
              namabarang: data["namabarang"],
              keluhan: data["keluhan"],
              lokasi: data["lokasi"],
              gedung: data["gedung"],
              pengirim: data["pengirim"],
              teknisi: data["teknisi"],
              mulai: data["mulai"],
              selesai: data["selesai"],
              statustiket: data["statustiket"],
              baca: data["baca"],
              tutup: data["tutup"],
              keterangan: data["keterangan"]);
          listtiket.add(tiket);
        }
        return listtiket;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return [];
  }

  Future<int?> kirimPesan(
      String alamat, String rahasia, String hp, String pesan) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$rahasia'
    };
    int hasil = 0;
    final request = await client.post(Uri.parse("$alamat"),
        headers: header,
        body: json.encode(
          {
            "recipient_type": "individual",
            "to": "$hp",
            "type": "text",
            "text": {"body": "$pesan"}
          },
        ));
    if (request.statusCode == 200) {
      var result = jsonDecode(request.body);
      hasil = result['code'];
      if (hasil == 200) {
        return 1;
      }
    } else {
      return 0;
    }
    return 0;
  }

  //tampilkan tiket berdasarkan PID teknisi / perorangan

  Future<List<Tiket?>> getMytiket(String pid, String token) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var respond =
          await client.get(Uri.parse("$url/mytiket/$pid"), headers: header);
      if (respond.statusCode == 200) {
        var jsonData = json.decode(respond.body);
        var jsonArray = jsonData['data'];
        List<Tiket> listtiket = [];
        for (var data in jsonArray) {
          Tiket tiket = Tiket(
              notiket: data["notiket"],
              tgl: data["tgl"],
              kodebarang: data["kodebarang"] ?? '',
              namabarang: data["namabarang"],
              keluhan: data["keluhan"],
              lokasi: data["lokasi"],
              gedung: data["gedung"] ?? '',
              pengirim: data["pengirim"],
              teknisi: data["teknisi"],
              mulai: data["mulai"],
              selesai: data["selesai"],
              statustiket: data["statustiket"],
              baca: data["baca"],
              tutup: data["tutup"],
              keterangan: data["keterangan"]);
          listtiket.add(tiket);
        }
        return listtiket;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return [];
  }

//tampilan tiket berdasarkan nomor tiket

  Future<Notiket?> tiketAction(String no) async {
    try {
      var respond = await client.get(Uri.parse("$url/tiketaction/$no"));
      if (respond.statusCode == 200) {
        final data = notiketFromJson(respond.body);
        return data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return null;
  }

  Future<bool> tiketStart(String no) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    final respond = await client.put(Uri.parse("$url/tiketstart"),
        headers: header, body: json.encode({"nomor": no}));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body)["error"];
      if (data == false) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
