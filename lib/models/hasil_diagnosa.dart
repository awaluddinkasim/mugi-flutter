import 'package:mugi/models/hasil.dart';

class HasilDiagnosa {
  String tanggal;
  List<Hasil> hasil;

  HasilDiagnosa({required this.tanggal, required this.hasil});

  factory HasilDiagnosa.fromJson(Map<String, dynamic> json) {
    return HasilDiagnosa(
      tanggal: json['tanggal'],
      hasil: List<Hasil>.from(json['hasil'].map((x) => Hasil.fromJson(x))),
    );
  }
}
