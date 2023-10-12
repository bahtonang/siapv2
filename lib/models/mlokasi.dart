class ModelLokasi {
  final String status;
  final List<Lokasi> data;

  ModelLokasi({
    required this.status,
    required this.data,
  });

  factory ModelLokasi.fromJson(Map<String, dynamic> json) => ModelLokasi(
        status: json["status"],
        data: List<Lokasi>.from(json["data"].map((x) => Lokasi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Lokasi {
  final String nama;

  Lokasi({
    required this.nama,
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}
