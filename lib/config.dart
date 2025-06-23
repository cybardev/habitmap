import 'package:flutter/cupertino.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('Config')),
          child: Center(child: Text('Y')),
        );
      },
    );
  }
}
