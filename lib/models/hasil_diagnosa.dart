class HasilDiagnosa {
  String tanggal;
  List hasil;

  HasilDiagnosa({required this.tanggal, required this.hasil});

  factory HasilDiagnosa.fromJson(Map<String, dynamic> json) {
    return HasilDiagnosa(
      tanggal: json['tanggal'],
      hasil: json['hasil'],
    );
  }
}
