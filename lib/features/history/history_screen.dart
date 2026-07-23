import 'package:flutter/material.dart';
import '../../widgets/activity/activity_tile.dart';

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
              "Today",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const ActivityTile(
              icon: Icons.water_drop,
              color: Colors.orange,
              time: "08:15 AM",
              waterType: "Copper Water",
              quantity: "250 ml",
              reason: "Morning Hydration",
            ),

            const ActivityTile(
              icon: Icons.water_drop,
              color: Colors.blue,
              time: "01:00 PM",
              waterType: "Mineral Water",
              quantity: "300 ml",
              reason: "Lunch Recommendation",
            ),

            const ActivityTile(
              icon: Icons.water_drop,
              color: Colors.green,
              time: "06:30 PM",
              waterType: "Alkaline Water",
              quantity: "250 ml",
              reason: "Evening Recovery",
            ),

            const SizedBox(height: 30),

            const Text(
              "Yesterday",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const ActivityTile(
              icon: Icons.water_drop,
              color: Colors.orange,
              time: "08:10 AM",
              waterType: "Copper Water",
              quantity: "250 ml",
              reason: "Morning Hydration",
            ),

            const ActivityTile(
              icon: Icons.water_drop,
              color: Colors.blue,
              time: "12:45 PM",
              waterType: "Mineral Water",
              quantity: "300 ml",
              reason: "Lunch Recommendation",
            ),
          ],
        ),
      ),
    );
  }
}