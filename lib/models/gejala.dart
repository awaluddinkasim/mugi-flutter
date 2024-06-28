class Gejala {
  String id;
  String nama;

  Gejala({
    required this.id,
    required this.nama,
  });

  factory Gejala.fromJson(Map<String, dynamic> json) {
    return Gejala(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
