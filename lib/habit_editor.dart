import 'package:flutter/cupertino.dart';

Future<void> showEditHabitDialog({
  required BuildContext context,
  required String initialValue,
  required List<String> habitList,
  required void Function(String updatedValue) onConfirm,
}) async {
  final controller = TextEditingController(text: initialValue);
  String? errorText;

  await showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          void tryConfirm() {
            final newText = controller.text.trim();

            if (newText.isEmpty) {
              setDialogState(() => errorText = 'Habit cannot be empty');
              return;
            }

            final isDuplicate = habitList.any(
              (h) =>
                  h.toLowerCase() == newText.toLowerCase() && h != initialValue,
            );

            if (isDuplicate) {
              setDialogState(() => errorText = 'Habit already exists');
              return;
            }

            onConfirm(newText);
            Navigator.of(context).pop();
          }

          return CupertinoAlertDialog(
            title: const Text('Edit Habit'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                CupertinoTextField(
                  controller: controller,
                  placeholder: 'Enter habit name',
                  autofocus: true,
                  onChanged: (_) {
                    setDialogState(() => errorText = null);
                  },
                  onSubmitted: (_) => tryConfirm(),
                ),
                if (errorText != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    errorText!,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoDialogAction(
                onPressed: tryConfirm,
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
  );
}
