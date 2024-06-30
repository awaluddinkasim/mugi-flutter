import 'package:mugi/models/hasil.dart';

class HasilDiagnosa {
  String tanggal;
  String pukul;
  List<Hasil> hasil;

  HasilDiagnosa({
    required this.tanggal,
    required this.pukul,
    required this.hasil,
  });

  factory HasilDiagnosa.fromJson(Map<String, dynamic> json) {
    return HasilDiagnosa(
      tanggal: json['tanggal'],
      pukul: json['pukul'],
      hasil: List<Hasil>.from(json['hasil'].map((x) => Hasil.fromJson(x))),
    );
  }
}
