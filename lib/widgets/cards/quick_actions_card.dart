import 'package:flutter/material.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;
  @override
  Widget build(BuildContext context) => Wrap(spacing: 10, runSpacing: 10, children: [
    for (final item in const [
      (Icons.insights_outlined, 'Analytics', 1),
      (Icons.history, 'History', 2),
      (Icons.router_outlined, 'Device', 3),
      (Icons.person_outline, 'Profile', 4),
    ])
      ActionChip(
        avatar: Icon(item.$1, size: 18),
        label: Text(item.$2),
        padding: const EdgeInsets.all(10),
        onPressed: () => onNavigate(item.$3),
      ),
  ]);
}
