import 'package:mugi/models/gejala.dart';
import 'package:mugi/shared/services/dio.dart';

class GejalaService {
  Future<List<Gejala>> getGejala({required String token}) async {
    final result = await Request.get('/gejala', headers: {
      'Authorization': 'Bearer $token',
    });

    List<Gejala> daftarGejala = [];
    for (var item in result['daftarGejala']) {
      daftarGejala.add(Gejala.fromJson(item));
    }

    return daftarGejala;
  }
}
