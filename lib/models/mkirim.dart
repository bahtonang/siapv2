class ModelKirim {
  final String? notiket;
  final String? tgl;
  final String? kodebarang;
  final String? namabarang;
  final String? keluhan;
  final String? lokasi;
  final String? gedung;
  final String? pengirim;
  final String? teknisi;
  final String? mulai;
  final String? selesai;
  final String? statustiket;
  final String? baca;
  final String? tutup;
  final String? keterangan;

  ModelKirim({
    required this.notiket,
    required this.tgl,
    required this.kodebarang,
    required this.namabarang,
    required this.keluhan,
    required this.lokasi,
    required this.gedung,
    required this.pengirim,
    required this.teknisi,
    required this.mulai,
    required this.selesai,
    required this.statustiket,
    required this.baca,
    required this.tutup,
    required this.keterangan,
  });

  factory ModelKirim.fromJson(Map<String, dynamic> json) => ModelKirim(
        notiket: json["notiket"],
        tgl: json["tgl"],
        kodebarang: json["kodebarang"],
        namabarang: json["namabarang"],
        keluhan: json["keluhan"],
        lokasi: json["lokasi"],
        gedung: json["gedung"],
        pengirim: json["pengirim"],
        teknisi: json["teknisi"],
        mulai: json["mulai"],
        selesai: json["selesai"],
        statustiket: json["statustiket"],
        baca: json["baca"],
        tutup: json["tutup"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "notiket": notiket,
        "tgl": tgl,
        "kodebarang": kodebarang,
        "namabarang": namabarang,
        "keluhan": keluhan,
        "lokasi": lokasi,
        "gedung": gedung,
        "pengirim": pengirim,
        "teknisi": teknisi,
        "mulai": mulai,
        "selesai": selesai,
        "statustiket": statustiket,
        "baca": baca,
        "tutup": tutup,
        "keterangan": keterangan,
      };
}
