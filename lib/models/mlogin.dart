class LoginModel {
  final bool error;
  final String message;
  final String accessToken;
  final User user;

  LoginModel({
    required this.error,
    required this.message,
    required this.accessToken,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        error: json["error"],
        message: json["message"],
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "access_token": accessToken,
        "user": user.toJson(),
      };
}

class User {
  final String pid;
  final String nama;
  final String gedung;
  final String kodebagian;

  User({
    required this.pid,
    required this.nama,
    required this.gedung,
    required this.kodebagian,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        pid: json["pid"],
        nama: json["nama"],
        gedung: json["gedung"],
        kodebagian: json["kodebagian"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "nama": nama,
        "gedung": gedung,
        "kodebagian": kodebagian,
      };
}
