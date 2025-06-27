import 'package:flutter/cupertino.dart';

class HabitPicker extends StatefulWidget {
  final List<String> habitList;
  final int initialIndex;
  final ValueChanged<int> onSelected;

  const HabitPicker({
    super.key,
    required this.habitList,
    required this.initialIndex,
    required this.onSelected,
  });

  @override
  State<HabitPicker> createState() => _HabitPickerState();
}

class _HabitPickerState extends State<HabitPicker> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _showPicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 24.0,
            scrollController: FixedExtentScrollController(
              initialItem: _selectedIndex,
            ),
            onSelectedItemChanged: (int selectedItem) {
              setState(() {
                _selectedIndex = selectedItem;
              });
              widget.onSelected(selectedItem);
            },
            children: widget.habitList
                .map((habit) => Center(child: Text(habit)))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: widget.habitList.isEmpty ? null : _showPicker,
        child: Text(
          _selectedIndex < widget.habitList.length
              ? widget.habitList[_selectedIndex]
              : 'No items',
        ),
      ),
    );
  }
}
