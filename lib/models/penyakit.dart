class Penyakit {
  String nama;
  String solusi;

  Penyakit({required this.nama, required this.solusi});

  factory Penyakit.fromJson(Map<String, dynamic> json) {
    return Penyakit(
      nama: json['nama'],
      solusi: json['solusi'],
    );
  }
}
