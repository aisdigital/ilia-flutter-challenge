import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/external/adapters/dependency_injector/auto_injector.dart';
import 'package:ilia_challenge/core/interfaces/int_cache.dart';

class Core {
  Core._() {
    _init();
  }

  factory Core() => _this;

  static final Core _this = Core._();

  late DependenciesInjector injector;
  get cache => injector.find<IntCache>();

  _init() {
    WidgetsFlutterBinding.ensureInitialized();

    injector = DependenciesInjector()..init();
  }
}
