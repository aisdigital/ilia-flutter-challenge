import 'package:get/get.dart';
import 'package:pixel_cinema/app/core/domain/entities/enums.dart';

abstract class StateStore {
  final Rx<StateStoreStatus> _status = Rx<StateStoreStatus>(StateStoreStatus.loading);

  StateStoreStatus get status => _status.value;
  Rx<StateStoreStatus> get rxStatus => _status;

  set status(StateStoreStatus value) => _status.value = value;
  set error(Exception? value) => _status.value = StateStoreStatus.error;

  void completed([String? value]) => _status.value = StateStoreStatus.completed;
  void loading() => _status.value = StateStoreStatus.loading;
  void noContent() => _status.value = StateStoreStatus.noContent;

  bool get isLoading => status == StateStoreStatus.loading;
  bool get hasError => status == StateStoreStatus.error;
  bool get isCompleted => status == StateStoreStatus.completed;
}
