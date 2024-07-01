import 'package:mugi/models/penyakit.dart';

class Hasil {
  Penyakit penyakit;
  double persentase;

  Hasil({required this.penyakit, required this.persentase});

  factory Hasil.fromJson(Map<String, dynamic> json) {
    return Hasil(
      penyakit: Penyakit.fromJson(json['penyakit']),
      persentase: double.parse(json['persentase'].toString()),
    );
  }
}
