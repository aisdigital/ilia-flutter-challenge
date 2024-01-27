import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/widgets/ilia_drawer_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IliaDrawer extends StatefulWidget {
  const IliaDrawer({super.key});

  @override
  State<IliaDrawer> createState() => _IliaDrawerState();
}

class _IliaDrawerState extends State<IliaDrawer> {
  ChallengeCore get core => injector.find<ChallengeCore>();
  IliaLayout get _layout => IliaLayout(context);

  get tileColor => Theme.of(context).colorScheme.primaryContainer;
  get backgroung => Theme.of(context).colorScheme.background;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: backgroung,
        child: SizedBox(
          height: _layout.height * .95,
          child: Column(
            children: <Widget>[
              Container(
                height: _layout.height * .13,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Ília Challenge',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              InkWell(
                onTap: () {
                  // routes.service.push(SystemRoutes.customers);
                },
                child: Container(
                    height: _layout.height * .1,
                    alignment: Alignment.center,
                    child: Text(
                      'Categorias',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ),
              const Spacer(),
              IliaDrawerTile(
                title: AppLocalizations.of(context)?.nowPlaying ?? '',
                ontap: () {},
              ),
              IliaDrawerTile(
                title: AppLocalizations.of(context)?.upcoming ?? '',
                ontap: () {},
              ),
              IliaDrawerTile(
                title: AppLocalizations.of(context)?.discover ?? '',
                ontap: () {},
              ),
              IliaDrawerTile(
                title: AppLocalizations.of(context)?.popular ?? '',
                ontap: () {},
              ),
              const Spacer(),
              Container(
                height: _layout.height * .08,
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                    valueListenable: core,
                    builder: (context, state, child) {
                      return ListTile(
                        title:
                            Text(AppLocalizations.of(context)?.language ?? ''),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              core.switchLanguage();
                            },
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
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: _layout.height * .08,
                alignment: Alignment.center,
                child: ListTile(
                  title: Text(AppLocalizations.of(context)?.darkMode ?? ''),
                  trailing: ValueListenableBuilder(
                      valueListenable: core,
                      builder: (context, state, child) {
                        return Switch(
                          value: state.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            core.switchTheme();
                          },
                        );
                      }),
                ),
              ),
              Container(
                  height: _layout.height * .07,
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () async {
                        // await core.clearCoreData();
                        // routes.service.pushReplacement(SystemRoutes.root);
                      },
                      child: Text(
                        AppLocalizations.of(context)?.exit ?? '',
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.fontSize ??
                                20,
                            color: Colors.red),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
