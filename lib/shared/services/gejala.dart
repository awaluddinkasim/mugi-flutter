import 'package:mugi/models/gejala.dart';
import 'package:mugi/shared/services/dio.dart';

class GejalaService {
  Future<Gejala> getGejala({required String token}) async {
    final result = await Request.get('/gejala', headers: {
      'Authorization': 'Bearer $token',
    });

    return Gejala.fromJson(result['daftarGejala']);
  }
}
