import 'package:flutter/material.dart';

class WaterDistributionCard extends StatelessWidget {
  const WaterDistributionCard({super.key});

  Widget buildWaterType(
    String title,
    double value,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text("${(value * 100).toInt()}%"),
          ],
        ),

        const SizedBox(height: 6),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            color: color,
            backgroundColor: Colors.grey.shade300,
          ),
        ),

        const SizedBox(height: 16),
      ],
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
              "Water Distribution",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            buildWaterType(
              "Copper Water",
              0.68,
              Colors.orange,
            ),

            buildWaterType(
              "Mineral Water",
              0.24,
              Colors.blue,
            ),

            buildWaterType(
              "Alkaline Water",
              0.08,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}