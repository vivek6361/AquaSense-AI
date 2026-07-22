import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key});

  Widget buildAchievement(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }

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
              "Achievements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            buildAchievement(
              Icons.local_fire_department,
              "7 Day Streak",
              "Drank water consistently for 7 days.",
              Colors.orange,
            ),

            const Divider(),

            buildAchievement(
              Icons.emoji_events,
              "Goal Achieved",
              "Completed today's hydration goal.",
              Colors.green,
            ),

            const Divider(),

            buildAchievement(
              Icons.workspace_premium,
              "Healthy Habit",
              "AI confidence remained above 90%.",
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}