class ModelTickets {
  final String status;
  final List<Tickets> data;

  ModelTickets({
    required this.status,
    required this.data,
  });

  factory ModelTickets.fromJson(Map<String, dynamic> json) => ModelTickets(
        status: json["status"],
        data: List<Tickets>.from(json["data"].map((x) => Tickets.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Tickets {
  final String notiket;
  final String namabarang;
  final String lokasi;
  final String keluhan;
  final dynamic nama;
  final dynamic bagian;
  final String statustiket;

  Tickets({
    required this.notiket,
    required this.namabarang,
    required this.lokasi,
    required this.keluhan,
    required this.nama,
    required this.bagian,
    required this.statustiket,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        notiket: json["notiket"],
        namabarang: json["namabarang"],
        lokasi: json["lokasi"],
        keluhan: json["keluhan"],
        nama: json["nama"],
        bagian: json["bagian"],
        statustiket: json["statustiket"],
      );

  Map<String, dynamic> toJson() => {
        "notiket": notiket,
        "namabarang": namabarang,
        "lokasi": lokasi,
        "keluhan": keluhan,
        "nama": nama,
        "bagian": bagian,
        "statustiket": statustiket,
      };
}
