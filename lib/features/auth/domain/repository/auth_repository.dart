import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
  });
}
