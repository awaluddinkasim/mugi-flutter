class DataUser {
  String nama;
  String email;
  String password;
  String jk;
  String noHp;

  DataUser({
    required this.nama,
    required this.email,
    required this.password,
    required this.jk,
    required this.noHp,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'password': password,
      'jk': jk,
      'no_hp': noHp,
    };
  }
}
