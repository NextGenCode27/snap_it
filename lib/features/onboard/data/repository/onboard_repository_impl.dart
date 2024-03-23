import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';
import 'package:snap_it/features/onboard/data/data_source/local/onboard_local_datasource.dart';
import 'package:snap_it/features/onboard/domain/repository/onboard_repository.dart';

class OnboardRepositoryImpl implements OnboardRepository {
  final OnboardLocaldatasource onboardLocaldatasource;
  OnboardRepositoryImpl(this.onboardLocaldatasource);
  @override
  Future<Either<Failure, bool>> loadApp() async {
    try {
      final appLoaded = await onboardLocaldatasource.loadApp();
      return right(appLoaded);
    } catch (e) {
      return left(
        Failure(message: e.toString()),
      );
    }
  }
}
