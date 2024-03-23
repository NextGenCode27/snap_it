import 'package:fpdart/fpdart.dart';
import 'package:snap_it/core/error/error.dart';
import 'package:snap_it/core/usecase/usecase.dart';
import 'package:snap_it/features/onboard/domain/repository/onboard_repository.dart';

class LoadAppUsecase implements Usecase<bool, NoParams> {
  final OnboardRepository onboardRepository;
  LoadAppUsecase(this.onboardRepository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await onboardRepository.loadApp();
  }
}
