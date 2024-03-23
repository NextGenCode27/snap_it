import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';
import 'package:snap_it/core/usecase/usecase.dart';
import 'package:snap_it/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase implements Usecase<String, LoginParams> {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);
  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
