import 'package:ilia_flutter_challenge/app/core/failures/failure.dart';

class GeneralFailure implements Failure {
  @override
  final String errorMessage;

  GeneralFailure({required this.errorMessage});
}
