import 'package:flutter/material.dart';

import '../../widgets/cards/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 45,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Vivek",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "AI Hydration Profile",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [

                  ProfileItem(
                    icon: Icons.water_drop,
                    title: "Daily Goal",
                    value: "3.5 L",
                  ),

                  Divider(height: 1),

                  ProfileItem(
                    icon: Icons.monitor_weight,
                    title: "Weight",
                    value: "73 kg",
                  ),

                  Divider(height: 1),

                  ProfileItem(
                    icon: Icons.height,
                    title: "Height",
                    value: "181 cm",
                  ),

                  Divider(height: 1),

                  ProfileItem(
                    icon: Icons.directions_run,
                    title: "Activity",
                    value: "Moderate",
                  ),

                  Divider(height: 1),

                  ProfileItem(
                    icon: Icons.favorite,
                    title: "Preferred Water",
                    value: "Copper",
                  ),

                  Divider(height: 1),

                  ProfileItem(
                    icon: Icons.router,
                    title: "Connected Device",
                    value: "AquaSense X1",
                  ),

                  Divider(height: 1),

                  ProfileItem(
                    icon: Icons.notifications,
                    title: "Notifications",
                    value: "Enabled",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "App Version 1.0.0",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}