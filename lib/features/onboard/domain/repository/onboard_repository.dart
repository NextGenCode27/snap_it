import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';

abstract interface class OnboardRepository {
  Future<Either<Failure, bool>> loadApp();
}
