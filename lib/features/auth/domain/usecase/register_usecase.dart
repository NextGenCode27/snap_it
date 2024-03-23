import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';
import 'package:snap_it/core/usecase/usecase.dart';
import 'package:snap_it/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements Usecase<String, RegisterParams> {
  final AuthRepository authRepository;
  RegisterUsecase(this.authRepository);
  @override
  Future<Either<Failure, String>> call(RegisterParams params) async {
    return await authRepository.register(
      userName: params.userName,
      email: params.email,
      phone: params.phone,
      password: params.password,
    );
  }
}

class RegisterParams {
  final String userName;
  final String email;
  final String phone;
  final String password;

  RegisterParams({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });
}
