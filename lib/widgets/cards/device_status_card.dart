import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class DeviceStatusCard extends StatelessWidget {
  final bool connected;
  final int filterHealth;
  final int tankLevel;
  final String pumpStatus;

  const DeviceStatusCard({
    super.key,
    required this.connected,
    required this.filterHealth,
    required this.tankLevel,
    required this.pumpStatus,
  });

  Widget buildStatusTile(
      IconData icon,
      String title,
      String value,
      Color color,
      ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 10),
            Text(title, style: AppTextStyles.caption),
            const SizedBox(height: 6),
            Text(
              value,
              style: AppTextStyles.cardTitle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                const Icon(
                  Icons.router,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  "Device Status",
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Icon(
                  connected
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: connected
                      ? AppColors.success
                      : AppColors.error,
                ),

                const SizedBox(width: 10),

                Text(
                  connected
                      ? "AquaSense Connected"
                      : "Device Offline",
                  style: AppTextStyles.body,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                buildStatusTile(
                  Icons.filter_alt,
                  "Filter",
                  "$filterHealth%",
                  AppColors.success,
                ),

                buildStatusTile(
                  Icons.water,
                  "Tank",
                  "$tankLevel%",
                  AppColors.primary,
                ),
              ],
            ),

            Row(
              children: [

                buildStatusTile(
                  Icons.settings,
                  "Pump",
                  pumpStatus,
                  AppColors.warning,
                ),

                buildStatusTile(
                  Icons.wifi,
                  "Wi-Fi",
                  connected ? "Online" : "Offline",
                  connected
                      ? AppColors.success
                      : AppColors.error,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              "Last Sync • Just Now",
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}