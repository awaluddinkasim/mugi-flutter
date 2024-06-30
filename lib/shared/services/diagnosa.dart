import 'package:mugi/models/data_gejala.dart';
import 'package:mugi/models/hasil_diagnosa.dart';
import 'package:mugi/shared/services/dio.dart';

class DiagnosaService {
  Future<HasilDiagnosa> diagnosa({
    required String token,
    required List<DataGejala> data,
  }) async {
    final formData = data.map((e) {
      if (e.jawaban == 'Ya') {
        return e.id;
      }
    }).toList();

    final result = await Request.post('/penyakit', data: {
      'gejala': formData
    }, headers: {
      'Authorization': 'Bearer $token',
    });

    return HasilDiagnosa.fromJson(result['diagnosa']);
  }
}
