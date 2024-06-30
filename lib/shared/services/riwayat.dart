import 'package:mugi/models/hasil_diagnosa.dart';
import 'package:mugi/shared/services/dio.dart';

class RiwayatService {
  Future<List<HasilDiagnosa>> getRiwayat({required String token}) async {
    final result = await Request.get('/hasil', headers: {
      'Authorization': 'Bearer $token',
    });

    List<HasilDiagnosa> hasilDiagnosa = [];

    for (var item in result['diagnosa']) {
      hasilDiagnosa.add(HasilDiagnosa.fromJson(item));
    }

    return hasilDiagnosa;
  }
}
