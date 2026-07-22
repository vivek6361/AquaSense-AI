import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class WaterQualityCard extends StatelessWidget {
  final double ph;
  final int tds;
  final double temperature;
  final double turbidity;

  const WaterQualityCard({
    super.key,
    required this.ph,
    required this.tds,
    required this.temperature,
    required this.turbidity,
  });

  Widget metricTile(String title, String value) {
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
            Text(
              title,
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: 8),
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
                  Icons.water_drop,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  "Water Quality",
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Center(
              child: Column(
                children: [

                  const Icon(
                    Icons.verified,
                    color: AppColors.success,
                    size: 42,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Excellent",
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.success,
                    ),
                  ),

                  Text(
                    "Safe for Drinking",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                metricTile("pH", ph.toString()),
                metricTile("TDS", "$tds ppm"),
              ],
            ),

            Row(
              children: [
                metricTile("Temp", "$temperature°C"),
                metricTile("Turb.", "$turbidity NTU"),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              "Last Updated • Just Now",
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}