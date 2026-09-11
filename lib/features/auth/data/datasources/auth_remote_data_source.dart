import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      // TODO: Replace with actual Afribase SDK call or API endpoint
      // Simulate network request
      await Future.delayed(const Duration(seconds: 2));
      if (email == 'test@test.com' && password == 'password') {
        return const UserModel(id: '1', email: 'test@test.com', name: 'Test User');
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}

class ServerException implements Exception {}
