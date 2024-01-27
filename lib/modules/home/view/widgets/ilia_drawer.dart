import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';
import 'package:ilia_challenge/main.dart';

class IliaDrawer extends StatefulWidget {
  const IliaDrawer({super.key});

  @override
  State<IliaDrawer> createState() => _IliaDrawerState();
}

class _IliaDrawerState extends State<IliaDrawer> {
  ChallengeCore get core => injector.find<ChallengeCore>();
  IliaLayout get _layout => IliaLayout(context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
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
                  color: Theme.of(context).colorScheme.surface,
                  height: _layout.height * .1,
                  alignment: Alignment.center,
                  child: const Text('Filtros')),
            ),
            SizedBox(height: _layout.height * .42),
            Container(
              height: _layout.height * .08,
              alignment: Alignment.center,
              child: ValueListenableBuilder(
                  valueListenable: core,
                  builder: (context, state, child) {
                    return ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height:
                                state.language == 'language=en-US' ? 26 : 20,
                            width: state.language == 'language=en-US' ? 39 : 30,
                            child: Image.asset(
                              'assets/images/us_flag.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height:
                                state.language == 'language=pt-BR' ? 25 : 20,
                            width: state.language == 'language=pt-BR' ? 39 : 30,
                            child: Image.asset(
                              'assets/images/br_flag.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      trailing: Switch(
                        value: state.language == 'language=pt-BR',
                        onChanged: (value) {
                          core.switchLanguage();
                        },
                      ),
                    );
                  }),
            ),
            Container(
              height: _layout.height * .08,
              alignment: Alignment.center,
              child: ListTile(
                title: const Text('Dark Mode'),
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
                height: _layout.height * .1,
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () async {
                      // await core.clearCoreData();
                      // routes.service.pushReplacement(SystemRoutes.root);
                    },
                    child: Text(
                      'Sair',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize ??
                                  20,
                          color: Colors.red),
                    ))),
          ],
        ),
      ),
    );
  }
}
