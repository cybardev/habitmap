import 'package:flutter/cupertino.dart';

import 'backup.dart';
import 'habit_editor.dart';

class HabitConfigPage extends StatefulWidget {
  final List<String> habitList;
  final VoidCallback onUpdate;

  const HabitConfigPage({
    super.key,
    required this.habitList,
    required this.onUpdate,
  });

  @override
  State<HabitConfigPage> createState() => _HabitConfigPageState();
}

class _HabitConfigPageState extends State<HabitConfigPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> habitTiles = [
      CupertinoButton(
        child: Text('Add'),
        onPressed: () {
          showEditHabitDialog(
            context: context,
            initialValue: '',
            habitList: widget.habitList,
            onConfirm: (updatedValue) {
              setState(() {
                widget.habitList.add(updatedValue);
                widget.habitList.sort();
                widget.onUpdate();
              });
            },
          );
        },
      ),
      ...List<Widget>.generate(widget.habitList.length, (int index) {
        return CupertinoListTile.notched(
          key: ValueKey(index),
          title: Text(widget.habitList[index]),
          trailing: CupertinoButton(
            child: Icon(CupertinoIcons.minus),
            onPressed: () {
              setState(() {
                widget.habitList.removeAt(index);
                widget.onUpdate();
              });
            },
          ),
          onTap: () {
            showEditHabitDialog(
              context: context,
              initialValue: widget.habitList[index],
              habitList: widget.habitList,
              onConfirm: (updatedValue) {
                setState(() {
                  widget.habitList[index] = updatedValue;
                  widget.habitList.sort();
                  widget.onUpdate();
                });
              },
            );
          },
        );
      }),
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Config'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: ListView(
        children: [
          BackupFormSection(),
          CupertinoFormSection.insetGrouped(
            header: const Text('HABITS'),
            children: habitTiles,
          ),
        ],
      ),
    );
  }
}
