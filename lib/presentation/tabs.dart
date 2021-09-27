import 'package:ilia_flutter_challenge/presentation/pages/home_page.dart';
import 'package:ilia_flutter_challenge/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentTab = mainSections.toList()[_currentTabIndex];
    return WillPopScope(
      onWillPop: () async =>
          !await currentTab.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: Material(
          child: IndexedStack(
            index: _currentTabIndex,
            children: mainSections
                .map(
                  _buildIndexedPageTab,
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[900]!,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.purple[900],
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: mainSections
                .map(
                  (mainNavigationTab) => BottomNavigationBarItem(
                    label: '',
                    icon: Icon(mainNavigationTab.icon),
                  ),
                )
                .toList(),
            currentIndex: _currentTabIndex,
            onTap: (newIndex) => setState(
              () => _currentTabIndex != newIndex
                  ? _currentTabIndex = newIndex
                  : currentTab.navigatorKey.currentState!
                      .popUntil((route) => route.isFirst),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndexedPageTab(BottomTabs mainSection) {
    return Navigator(
      key: mainSection.navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => mainSections.toList()[_currentTabIndex].tab,
      ),
    );
  }
}

class BottomTabs {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget tab;
  final IconData icon;

  BottomTabs({
    required this.icon,
    required this.tab,
    required this.navigatorKey,
  });
}

final Set<BottomTabs> mainSections = {
  BottomTabs(
    tab: const HomePage(),
    icon: Icons.home_rounded,
    navigatorKey: GlobalKey<NavigatorState>(),
  ),
  BottomTabs(
    tab: const SearchPage(),
    icon: Icons.search,
    navigatorKey: GlobalKey<NavigatorState>(),
  ),
};
