// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$stateAtom = Atom(name: '_SplashControllerBase.state');

  @override
  ControlState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ControlState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$failureMessageAtom =
      Atom(name: '_SplashControllerBase.failureMessage');

  @override
  String get failureMessage {
    _$failureMessageAtom.reportRead();
    return super.failureMessage;
  }

  @override
  set failureMessage(String value) {
    _$failureMessageAtom.reportWrite(value, super.failureMessage, () {
      super.failureMessage = value;
    });
  }

  final _$_SplashControllerBaseActionController =
      ActionController(name: '_SplashControllerBase');

  @override
  void _setFailureState(String message) {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction(
        name: '_SplashControllerBase._setFailureState');
    try {
      return super._setFailureState(message);
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
failureMessage: ${failureMessage}
    ''';
  }
}
