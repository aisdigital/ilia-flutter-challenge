import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final Duration _duration;
  Timer? _timer;

  Debouncer({
    Duration duration = const Duration(milliseconds: 300),
  }) : _duration = duration;

  run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }

    _timer = Timer(_duration, action);
  }

  cancel() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }
}
