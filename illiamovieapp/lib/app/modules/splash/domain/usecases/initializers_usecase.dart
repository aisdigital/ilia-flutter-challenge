import 'package:illiamovieapp/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:illiamovieapp/app/core/network/dio_config.dart';
import 'package:illiamovieapp/app/core/network/network_info.dart';
import 'package:illiamovieapp/app/core/usecases/usecase.dart';

class InitializersUseCase implements UseCase<bool, NoParams> {
  final DioConfig _dioConfig;
  final INetworkInfo _networkInfo;

  InitializersUseCase({
    required DioConfig dioConfig,
    required INetworkInfo networkInfo,
  })  : _dioConfig = dioConfig,
        _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, bool>> call(NoParams params) async {
    try {
      await _networkInfo.init();
      _dioConfig.init();

      return Right(true);
    } catch (e) {
      return Left(
        Failure(
          message: 'Falha ao iniciar o app',
        ),
      );
    }
  }
}
