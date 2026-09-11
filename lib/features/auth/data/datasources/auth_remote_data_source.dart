import '../../../../config/afribase/afribase_service.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signUp(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final result = await AfribaseService.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = result.user;

      if (user == null) {
        throw ServerException();
      }

      return UserModel(
        id: user.id,
        email: user.email,
        name: user.userMetadata['name'] ?? '',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    try {
      final result = await AfribaseService.client.auth.signUp(
        email: email,
        password: password,
      );
      final user = result.user;

      if (user == null) {
        throw ServerException();
      }

      return UserModel(
        id: user.id,
        email: user.email,
        name: user.userMetadata['name'] ?? '',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'An error occurred']);

  @override
  String toString() => message;
}
