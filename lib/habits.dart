import 'package:flutter/cupertino.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('Habits')),
          child: Center(child: Text('X')),
        );
      },
    );
  }
}
