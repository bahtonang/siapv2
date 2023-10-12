class ModelOnesend {
  final String status;
  final Onesend data;

  ModelOnesend({
    required this.status,
    required this.data,
  });

  factory ModelOnesend.fromJson(Map<String, dynamic> json) => ModelOnesend(
        status: json["status"],
        data: Onesend.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Onesend {
  final String alamat;
  final String rahasia;

  Onesend({
    required this.alamat,
    required this.rahasia,
  });

  factory Onesend.fromJson(Map<String, dynamic> json) => Onesend(
        alamat: json["alamat"],
        rahasia: json["rahasia"],
      );

  Map<String, dynamic> toJson() => {
        "alamat": alamat,
        "rahasia": rahasia,
      };
}
