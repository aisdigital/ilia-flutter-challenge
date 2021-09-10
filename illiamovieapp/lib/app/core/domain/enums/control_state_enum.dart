import 'package:flutter/foundation.dart';

enum ControlState {
  start,
  empty,
  loading,
  sucess,
  failure,
}

extension ParseToString on ControlState {
  String toShortString() => describeEnum(this);

  bool get isStart => this == ControlState.start;
  bool get isEmpty => this == ControlState.empty;
  bool get isLoading => this == ControlState.loading;
  bool get isSucess => this == ControlState.sucess;
  bool get isFailure => this == ControlState.failure;
  bool get isNotStart => this != ControlState.start;
  bool get isNotEmpty => this != ControlState.empty;
  bool get isNotLoading => this != ControlState.loading;
  bool get isNotSucess => this != ControlState.sucess;
  bool get isNotFailure => this != ControlState.failure;
}
