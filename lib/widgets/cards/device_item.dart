import 'package:flutter/material.dart';

class DeviceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DeviceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(title),
      trailing: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}