class Penyakit {
  String nama;
  String deskripsi;
  String caraPenanganan;

  Penyakit({required this.nama, required this.deskripsi, required this.caraPenanganan});

  factory Penyakit.fromJson(Map<String, dynamic> json) {
    return Penyakit(
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      caraPenanganan: json['cara_penanganan'],
    );
  }
}
