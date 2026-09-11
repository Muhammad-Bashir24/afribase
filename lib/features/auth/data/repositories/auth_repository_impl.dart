import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signUp(String email, String password) async {
    try {
      final user = await remoteDataSource.signUp(email, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
