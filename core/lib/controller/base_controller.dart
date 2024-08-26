import 'package:core/state/base_state.dart';
import 'package:flutter/foundation.dart';

/// A classe abstrata `BaseController` é projetada para gerenciar e notificar
/// alterações de estado utilizando a classe `ValueNotifier`.
///
/// [T] representa o tipo de estado que o controlador gerencia e deve estender
/// `BaseState`.
/// Essa classe pode usar builder como [ValueListenableBuilder],
/// [ListenableBuilder] ou [AnimatedBuilder].
abstract class BaseController<T extends BaseState> implements ValueListenable<T> {
  late final ValueNotifier<T> _stateNotifier;

  /// Obtém o estado atual mantido pelo `_stateNotifier`.
  T get state => _stateNotifier.value;

  /// Obtém o estado atual mantido pelo `_stateNotifier`.
  @override
  T get value => _stateNotifier.value;

  /// Cria uma instância de `BaseController` com um estado inicial fornecido.
  ///
  /// [initialState] O estado inicial para o controlador.
  BaseController(T initialState) {
    _stateNotifier = ValueNotifier<T>(initialState);
  }

  /// Adiciona um listener que será chamado sempre que o estado mudar.
  ///
  /// [listener] A função de callback a ser chamada nas mudanças de estado.
  @override
  void addListener(VoidCallback listener) {
    _stateNotifier.addListener(listener);
  }

  /// Remove um listener previamente adicionado.
  ///
  /// [listener] A função de callback a ser removida.
  @override
  void removeListener(VoidCallback listener) {
    _stateNotifier.removeListener(listener);
  }

  /// Atualiza o estado atual com um novo estado.
  ///
  /// [newState] O novo estado para atualizar.
  @protected
  void update(T newState) {
    _stateNotifier.value = newState;
  }

  /// Libera os recursos.
  void dispose() {
    _stateNotifier.dispose();
  }
}
