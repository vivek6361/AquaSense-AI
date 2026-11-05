import 'package:flutter/material.dart';

void showDeviceActionNotice(BuildContext context) {
  showModalBottomSheet<void>(
    context: context, showDragHandle: true, isScrollControlled: true,
    builder: (context) => SafeArea(child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Icon(Icons.router_outlined, size: 40, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 16),
        Text('Device connection needed', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        const Text('This preview uses sample readings. Live dispensing, restart and diagnostics are not connected in this source version. No command has been sent to your purifier.'),
        const SizedBox(height: 24),
        FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Got it')),
      ]),
    )),
  );
}
