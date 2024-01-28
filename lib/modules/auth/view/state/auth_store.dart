import 'package:flutter/material.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_state.dart';

class AuthStore extends ValueNotifier<AuthState> {
  AuthStore() : super(AuthState());

  login() {
    bool hasValidSession = true;
    return hasValidSession;
  }

  logout() {
    bool hasValidSession = true;
    return hasValidSession;
  }
}
