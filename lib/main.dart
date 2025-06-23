import 'package:flutter/cupertino.dart';

import 'config.dart';
import 'habits.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'HabitMap',
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: const TabScaffold(),
    );
  }
}

class TabScaffold extends StatefulWidget {
  const TabScaffold({super.key});

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  final List<Widget> _tabs = [const HabitsPage(), const ConfigPage()];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Config',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return _tabs[index];
      },
    );
  }
}
