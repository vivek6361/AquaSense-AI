import 'package:flutter/material.dart';

import '../common/action_tile.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

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
              "Explore AquaSense",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                ActionTile(
                  icon: Icons.analytics,
                  title: "Analytics",
                  onTap: () {},
                ),

                ActionTile(
                  icon: Icons.history,
                  title: "History",
                  onTap: () {},
                ),
              ],
            ),

            Row(
              children: [

                ActionTile(
                  icon: Icons.router,
                  title: "Device",
                  onTap: () {},
                ),

                ActionTile(
                  icon: Icons.person,
                  title: "Profile",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}