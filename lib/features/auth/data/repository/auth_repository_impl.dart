import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';
import 'package:snap_it/core/error/exception.dart';
import 'package:snap_it/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:snap_it/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl(this.authRemoteDatasource);
  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDatasource.login(
        email: email,
        password: password,
      );
      return right(user);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final user = await authRemoteDatasource.register(
        userName: userName,
        email: email,
        phone: phone,
        password: password,
      );
      return right(user);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
