class ModelPersonal {
  final String status;
  final List<Personal> data;

  ModelPersonal({
    required this.status,
    required this.data,
  });

  factory ModelPersonal.fromJson(Map<String, dynamic> json) => ModelPersonal(
        status: json["status"],
        data:
            List<Personal>.from(json["data"].map((x) => Personal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Personal {
  final String pid;
  final String nama;
  final String hp;

  Personal({
    required this.pid,
    required this.nama,
    required this.hp,
  });

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        pid: json["pid"],
        nama: json["nama"],
        hp: json["hp"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "nama": nama,
        "hp": hp,
      };
}
