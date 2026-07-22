import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class HydrationScoreCard extends StatelessWidget {
  final int score;
  final String status;

  const HydrationScoreCard({
    super.key,
    required this.score,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.water_drop,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  "Hydration Score",
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text(
              "$score%",
              style: AppTextStyles.heading1.copyWith(
                fontSize: 42,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: AppColors.success,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}