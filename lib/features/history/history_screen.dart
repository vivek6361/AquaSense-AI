import 'package:flutter/material.dart';

import '../../widgets/cards/activity_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),

      appBar: AppBar(
        title: const Text("Activity"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Today's Intake",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "1.8 L Consumed",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            const ActivityTile(
              icon: Icons.wb_sunny,
              iconColor: Colors.orange,
              time: "8:15 AM",
              waterType: "Copper Water",
              quantity: "250 ml",
              reason: "Morning Hydration",
            ),

            Divider(),

            const ActivityTile(
              icon: Icons.restaurant,
              iconColor: Colors.blue,
              time: "1:10 PM",
              waterType: "Mineral Water",
              quantity: "300 ml",
              reason: "Lunch Hydration",
            ),

            Divider(),

            const ActivityTile(
              icon: Icons.fitness_center,
              iconColor: Colors.green,
              time: "6:30 PM",
              waterType: "Alkaline Water",
              quantity: "250 ml",
              reason: "Workout Recovery",
            ),
          ],
        ),
      ),
    );
  }
}