import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class AIRecommendationCard extends StatelessWidget {
  final String waterType;
  final String quantity;
  final int confidence;
  final String reason;

  const AIRecommendationCard({
    super.key,
    required this.waterType,
    required this.quantity,
    required this.confidence,
    required this.reason,
  });

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
                  Icons.psychology,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  "AI Recommendation",
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              waterType,
              style: AppTextStyles.heading2,
            ),

            Text(
              quantity,
              style: AppTextStyles.body,
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: LinearProgressIndicator(
                    value: confidence / 100,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),

                const SizedBox(width: 12),

                Text(
                  "$confidence%",
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              reason,
              style: AppTextStyles.body,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.local_drink),

                label: const Text(
                  "Dispense Now",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}