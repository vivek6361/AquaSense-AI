import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String time;
  final String waterType;
  final String quantity;
  final String reason;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.color,
    required this.time,
    required this.waterType,
    required this.quantity,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          waterType,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quantity),
            Text(reason),
          ],
        ),
        trailing: Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}