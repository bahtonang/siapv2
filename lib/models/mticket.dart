class ModelTicket {
  final String status;
  final Ticket data;

  ModelTicket({
    required this.status,
    required this.data,
  });

  factory ModelTicket.fromJson(Map<String, dynamic> json) => ModelTicket(
        status: json["status"],
        data: Ticket.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Ticket {
  final String notiket;
  final String namabarang;
  final String lokasi;
  final String keluhan;
  final dynamic nama;
  final dynamic bagian;
  final String statustiket;

  Ticket({
    required this.notiket,
    required this.namabarang,
    required this.lokasi,
    required this.keluhan,
    required this.nama,
    required this.bagian,
    required this.statustiket,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
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
