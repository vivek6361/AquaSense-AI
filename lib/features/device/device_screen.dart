import 'package:flutter/material.dart';

import '../../widgets/cards/device_item.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: const Text("Device"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "AquaSense X1",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Connected",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  DeviceItem(
                    icon: Icons.wifi,
                    title: "Wi-Fi",
                    value: "Connected",
                  ),
                  Divider(height: 1),
                  DeviceItem(
                    icon: Icons.water_drop,
                    title: "Tank Level",
                    value: "82%",
                  ),
                  Divider(height: 1),
                  DeviceItem(
                    icon: Icons.filter_alt,
                    title: "Filter Health",
                    value: "94%",
                  ),
                  Divider(height: 1),
                  DeviceItem(
                    icon: Icons.settings,
                    title: "Pump Status",
                    value: "Ready",
                  ),
                  Divider(height: 1),
                  DeviceItem(
                    icon: Icons.thermostat,
                    title: "Temperature",
                    value: "24°C",
                  ),
                  Divider(height: 1),
                  DeviceItem(
                    icon: Icons.sync,
                    title: "Last Sync",
                    value: "Just Now",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart Device"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.health_and_safety),
                label: const Text("Run Diagnostics"),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}