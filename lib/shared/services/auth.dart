import 'package:mugi/models/auth.dart';
import 'package:mugi/models/data_login.dart';
import 'package:mugi/models/user.dart';
import 'package:mugi/shared/services/dio.dart';

class AuthService {
  Future<Auth> login(DataLogin data) async {
    final result = await Request.post('/login', data: data.toJson());

    final user = User.fromJson(result['user']);
    final token = result['token'];

    return Auth(token: token, user: user);
  }

  Future<void> logout({required String token}) async {
    await Request.delete('/logout', headers: {
      'Authorization': 'Bearer $token',
    });
  }

  Future<Auth> getUser({required String token}) async {
    final result = await Request.get('/user', headers: {
      'Authorization': 'Bearer $token',
    });

    final user = User.fromJson(result['user']);

    return Auth(token: token, user: user);
  }

  Future<User> updateUser(User user) async {
    final result = await Request.patch('/user', data: user.toJson());

    return User.fromJson(result['user']);
  }
}
