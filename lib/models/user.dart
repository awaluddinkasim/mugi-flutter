class User {
  String nama;
  String email;
  String jk;
  String noHp;

  User({required this.nama, required this.email, required this.jk, required this.noHp});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nama: json['nama'],
      email: json['email'],
      jk: json['jk'],
      noHp: json['no_hp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'jk': jk,
      'noHp': noHp,
    };
  }
}
