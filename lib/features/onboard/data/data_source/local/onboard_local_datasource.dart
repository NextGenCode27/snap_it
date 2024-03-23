import 'package:snap_it/core/error/exception.dart';

abstract interface class OnboardLocaldatasource {
  Future<bool> loadApp();
}

class OnboardLocaldatasourceImpl implements OnboardLocaldatasource {
  @override
  Future<bool> loadApp() async {
    bool isLoaded = false;
    try {
      if (isLoaded == false) {
        await Future.delayed(const Duration(seconds: 3));
        isLoaded = true;
      }
      isLoaded = false;
      return isLoaded;
    } on ServerException catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
