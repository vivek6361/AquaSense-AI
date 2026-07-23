import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String time;
  final String waterType;
  final String quantity;
  final String reason;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.time,
    required this.waterType,
    required this.quantity,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.15),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        "$waterType • $quantity",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(reason),
      trailing: Text(
        time,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}