import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedantic/pedantic.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/dio_config.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../home/home_module.dart';

class InitializersUseCase implements UseCase<void, NoParams> {
  final DioConfig _dioConfig;
  final INetworkInfo _networkInfo;

  InitializersUseCase({
    required DioConfig dioConfig,
    required INetworkInfo networkInfo,
  })  : _dioConfig = dioConfig,
        _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, void>> call(NoParams params) async {
    try {
      await _networkInfo.init();
      _dioConfig.init();
      unawaited(Modular.to.pushReplacementNamed(HomeModule.routeName));
      return Right(voidRight);
    } catch (e) {
      return Left(
        Failure(
          message: 'Falha ao iniciar o app',
        ),
      );
    }
  }
}
