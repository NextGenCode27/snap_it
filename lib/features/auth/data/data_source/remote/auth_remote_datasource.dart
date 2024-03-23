import 'package:snap_it/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<String> login({
    required String email,
    required String password,
  });
  Future<String> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl(this.supabaseClient);
  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      if (user.user == null) {
        return 'User is null';
      }
      return user.user!.id;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<String> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final user = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': userName,
          'phone': phone,
        },
      );

      if (user.user == null) {
        return 'User is null';
      }
      return user.user!.id;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
