import 'package:mugi/models/data_user.dart';
import 'package:mugi/shared/services/dio.dart';

class RegisterService {
  Future<Map<String, dynamic>> register(DataUser data) async {
    final result = await Request.post('/register', data: data.toJson());
    return result;
  }
}
