import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_routes.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/auth/contracts/interfaces/i_authentication.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_state.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_store.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ilia_challenge/modules/home/view/home_page.dart';

class SignInPage extends StatefulWidget {
  static const String route = '/signin';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  IliaLayout get layout => IliaLayout(context);

  final _loginKey = GlobalKey<FormState>();

  IliaRouter routes = injector.find<IliaRouter>();
  AuthStore auth = injector.find<AuthStore>();

  late Timer timer;
  final duration = const Duration(seconds: 4);

  List images = [
    'assets/images/cinema1.jpeg',
    'assets/images/cinema2.jpeg',
    'assets/images/cinema3.jpeg',
    'assets/images/cinema4.jpeg',
  ];

  @override
  void initState() {
    timer = Timer.periodic(duration, _transitionHandler);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  int index = 0;

  _transitionHandler(timer) {
    setState(() {
      if (index == 2) index = 3;
      if (index == 1) index = 2;
      if (index == 0) index = 1;
      if (index == 3) index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            child: SizedBox(
              key: Key(index.toRadixString(2)),
              height: layout.height,
              width: layout.width,
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: layout.height,
            width: layout.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(15, 20, 30, .9),
                Color.fromRGBO(35, 40, 50, .7),
                Color.fromRGBO(20, 30, 30, .65),
              ],
            )),
          ),
          SingleChildScrollView(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Form(
                    key: _loginKey,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: layout.height * .2),
                            Center(
                              child: Text(
                                AppLocalizations.of(context)?.iliaChallenge ??
                                    '',
                                maxLines: 1,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            SizedBox(height: layout.height * .3),
                            ValueListenableBuilder(
                                valueListenable: auth,
                                builder: (context, state, _) {
                                  bool loading = state.data[AuthData.signin] ==
                                      AuthStatus.authenticating;
                                  return SizedBox(
                                    height: 80,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black38),
                                      child: !loading
                                          ? Text(AppLocalizations.of(context)
                                                  ?.signin ??
                                              '')
                                          : const CircularProgressIndicator(),
                                      onPressed: () async {
                                        if (loading) return;

                                        Navigator.pushNamed(
                                            context, HomePage.route);
                                      },
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
