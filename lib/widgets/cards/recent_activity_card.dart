import 'package:flutter/material.dart';

import '../common/activity_tile.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Recent Activity",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const ActivityTile(
              icon: Icons.wb_sunny,
              time: "8:15 AM",
              waterType: "Copper Water",
              quantity: "250 ml",
              reason: "Morning Hydration",
            ),

            const Divider(),

            const ActivityTile(
              icon: Icons.restaurant,
              time: "1:00 PM",
              waterType: "Mineral Water",
              quantity: "300 ml",
              reason: "Lunch Recommendation",
            ),

            const Divider(),

            const ActivityTile(
              icon: Icons.nightlight_round,
              time: "6:30 PM",
              waterType: "Alkaline Water",
              quantity: "250 ml",
              reason: "Evening Recovery",
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("View Full History"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}