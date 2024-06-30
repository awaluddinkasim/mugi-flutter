class DataGejala {
  int id;
  String jawaban;

  DataGejala({
    required this.id,
    required this.jawaban,
  });

  Map<String, Object> toJson() {
    return {
      'id': id,
      'jawaban': jawaban,
    };
  }
}
