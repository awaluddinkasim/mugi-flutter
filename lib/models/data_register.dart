class DataRegister {
  String nama;
  String email;
  String password;
  String jk;
  String noHp;

  DataRegister({
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
      'noHp': noHp,
    };
  }
}
