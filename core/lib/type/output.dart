import 'package:either_dart/either.dart';

import '../error/base_exception.dart';

typedef Output<T> = Either<BaseException, T>;
