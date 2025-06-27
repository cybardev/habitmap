import 'package:flutter/cupertino.dart';

import 'config.dart';
import 'habits.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: AppScaffold(),
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final List<String> _habitList = <String>[];
  int _habitIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Habits'),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.settings),
          onPressed: () => {
            Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (context) => HabitConfigPage(
                  habitList: _habitList,
                  onUpdate: () => setState(() {}),
                ),
              ),
            ),
          },
        ),
      ),
      child: HabitPicker(
        habitList: _habitList,
        initialIndex: _habitIndex,
        onSelected: (int selected) {
          setState(() {
            _habitIndex = selected;
          });
        },
      ),
    );
  }
}
