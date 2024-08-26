import '../error/base_exception.dart';

class BaseState<T> {
  final bool isLoading;
  final T? data;
  final BaseException? exception;

  BaseState({
    this.data,
    this.isLoading = false,
    this.exception,
  });

  BaseState<T> copyWith({
    bool? isLoading,
    T? data,
    BaseException? exception,
  }) {
    return BaseState<T>(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      exception: exception ?? this.exception,
    );
  }
}
