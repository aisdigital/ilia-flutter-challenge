import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/domain/services/movies_uri_builder_service.dart';
import 'package:ilia_challenge/core/infra/services/models/api_config.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/auth/domain/auth_respository.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_state.dart';
import 'package:ilia_challenge/modules/home/domain/movies_section.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';

class AuthStore extends ValueNotifier<AuthState> {
  final ChallengeCore core = injector.find<ChallengeCore>();
  final SignInRepository _repo = injector.find<SignInRepository>();
  AuthStore() : super(AuthState());

  login() {
    bool hasValidSession = true;
    return hasValidSession;
  }

  logout() {
    bool hasValidSession = false;
    return hasValidSession;
  }

  Future getConfig() async {
    final uriService = MoviesUriBuilderService()
      ..setPath(path: MovieSection.config.path);

    final (error, response) =
        await _repo.getConfig(route: uriService.uriConfig);
    if (error == null) {
      core.boostrap(
          mediaConfig: MediaConfig.fromJson(response!.data['images']));
      if (navigatorKey.currentContext != null) {
        Navigator.pushNamed(navigatorKey.currentContext!, HomePage.route);
      }
    }
  }
}
