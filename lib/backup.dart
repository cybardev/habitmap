import 'package:flutter/cupertino.dart';

class BackupFormSection extends StatefulWidget {
  const BackupFormSection({super.key});

  @override
  State<BackupFormSection> createState() => _BackupFormSectionState();
}

class _BackupFormSectionState extends State<BackupFormSection> {
  final TextEditingController _serverController = TextEditingController();
  bool _isValid = false;

  final RegExp _addressRegex = RegExp(
    r'^('
    // IPv4
    r'(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.){3}'
    r'(?:25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])'
    '|'
    // IPv6
    r'\[?[A-Fa-f0-9:]+\]?'
    '|'
    // Domain
    r'(?:(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,})'
    ')'
    // Port (optional)
    r'(?::\d{1,5})?$',
  );

  void _validateInput(String value) {
    setState(() {
      _isValid = _addressRegex.hasMatch(value.trim());
    });
  }

  @override
  void initState() {
    super.initState();
    _serverController.addListener(() {
      _validateInput(_serverController.text);
    });
  }

  @override
  void dispose() {
    _serverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: const Text('BACKUP'),
      children: [
        CupertinoTextFormFieldRow(
          prefix: const Text('Server:'),
          controller: _serverController,
          placeholder: '127.0.0.2 or domain.com',
        ),
        CupertinoButton(
          onPressed: _isValid
              ? () {
                  // TODO: send data to server
                }
              : null,
          child: const Text('Sync'),
        ),
      ],
    );
  }
}
