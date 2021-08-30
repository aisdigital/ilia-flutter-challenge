// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$isConnectedAtom = Atom(name: '_AppControllerBase.isConnected');

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  final _$_listenConnectivityChangeAsyncAction =
      AsyncAction('_AppControllerBase._listenConnectivityChange');

  @override
  Future<void> _listenConnectivityChange() {
    return _$_listenConnectivityChangeAsyncAction
        .run(() => super._listenConnectivityChange());
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected}
    ''';
  }
}
