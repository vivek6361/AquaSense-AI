import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String water;
  final String quantity;
  final int confidence;
  final String reason;

  const RecommendationCard({
    super.key,
    required this.water,
    required this.quantity,
    required this.confidence,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Row(
              children: [

                Icon(
                  Icons.psychology,
                  color: Colors.green,
                  size: 28,
                ),

                SizedBox(width: 10),

                Text(
                  "AI Recommendation",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              water,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              quantity,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: confidence / 100,
              minHeight: 10,
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
              backgroundColor: Colors.grey.shade300,
            ),

            const SizedBox(height: 10),

            Text(
              "Confidence : $confidence%",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Reason",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(reason),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.local_drink),
                label: const Text("Dispense Recommended Water"),
              ),
            )
          ],
        ),
      ),
    );
  }
}