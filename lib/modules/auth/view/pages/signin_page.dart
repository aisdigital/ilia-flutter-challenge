import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/router_service.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/auth/view/state/auth_store.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatefulWidget {
  static const String route = '/signin';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  IliaLayout get _layout => IliaLayout(context);
  ChallengeCore get core => injector.find<ChallengeCore>();

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

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: Platform.isIOS ? false : true,
      child: PopScope(
        canPop: false,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              child: SizedBox(
                key: Key(index.toRadixString(2)),
                height: _layout.height,
                width: _layout.width,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: _layout.height,
              width: _layout.width,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: _layout.height * .2),
                              Center(
                                child: Text(
                                  'Ília',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                              SizedBox(height: _layout.height * .1),
                              Center(
                                child: Text(
                                  AppLocalizations.of(context)
                                          ?.flutterChallenge ??
                                      '',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(height: _layout.height * .2),
                              ValueListenableBuilder(
                                  valueListenable: auth,
                                  builder: (context, state, _) {
                                    return SizedBox(
                                      height: 80,
                                      width: _layout.width * .7,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black38),
                                        child: _loading
                                            ? const CircularProgressIndicator()
                                            : Text(AppLocalizations.of(context)
                                                    ?.signin ??
                                                ''),
                                        onPressed: () async {
                                          setState(() => _loading = true);
                                          await auth.getConfig();
                                          setState(() => _loading = false);
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
            Align(
              alignment: Alignment.topRight,
              child: Material(
                child: ValueListenableBuilder(
                    valueListenable: core,
                    builder: (context, state, child) {
                      return GestureDetector(
                        onTap: () => core.switchLanguage(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, right: 15),
                          child: AnimatedCrossFade(
                              duration: Durations.medium3,
                              crossFadeState:
                                  state.locale == const Locale('en', 'US')
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                              firstChild: SizedBox(
                                height: 30,
                                width: 45,
                                child: Image.asset(
                                  'assets/images/us_flag.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              secondChild: SizedBox(
                                  height: 30,
                                  width: 45,
                                  child: Image.asset(
                                    'assets/images/br_flag.png',
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
