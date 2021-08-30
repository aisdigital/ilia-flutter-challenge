import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../../network/network_info.dart';
import '../../usecases/usecase.dart';

class GetConnectivityStreamUseCase implements UseCase<Stream<bool>, NoParams> {
  final INetworkInfo _networkInfo;

  GetConnectivityStreamUseCase({required INetworkInfo networkInfo})
      : _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, Stream<bool>>> call(NoParams params) async {
    try {
      return Right(_networkInfo.streamIsConnected);
    } catch (e) {
      return Left(InternetConectionFailure());
    }
  }
}
