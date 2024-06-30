import 'package:mugi/models/penyakit.dart';

class Hasil {
  Penyakit penyakit;
  int persentase;

  Hasil({required this.penyakit, required this.persentase});

  factory Hasil.fromJson(Map<String, dynamic> json) {
    return Hasil(
      penyakit: Penyakit.fromJson(json['penyakit']),
      persentase: json['persentase'],
    );
  }
}
