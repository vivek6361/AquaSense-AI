import 'package:flutter/material.dart';

class PremiumHeader extends StatelessWidget {
  const PremiumHeader({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Good morning' : hour < 17 ? 'Good afternoon' : 'Good evening';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF122F35), Color(0xFF006B65)],
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Icon(Icons.water_drop_outlined, color: Color(0xFF9FF5DF)),
          SizedBox(width: 10),
          Expanded(child: Text('AQVYNTRA', style: TextStyle(
            color: Colors.white, letterSpacing: 3, fontWeight: FontWeight.w700))),
        ]),
        const SizedBox(height: 28),
        Text('$greeting,', style: const TextStyle(color: Colors.white70, fontSize: 16)),
        const SizedBox(height: 4),
        Text(userName, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        const Text('Your water. Your routine.', style: TextStyle(color: Color(0xFF9FF5DF), fontSize: 18)),
        const SizedBox(height: 8),
        const Text('Quality, activity and hydration in one place.',
          style: TextStyle(color: Colors.white70, height: 1.5)),
      ]),
    );
  }
}
