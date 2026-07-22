import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final String time;
  final String waterType;
  final String quantity;
  final String reason;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.time,
    required this.waterType,
    required this.quantity,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(
        "$waterType • $quantity",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(reason),
      trailing: Text(
        time,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}