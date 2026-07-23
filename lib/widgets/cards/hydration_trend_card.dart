import 'package:flutter/material.dart';

class HydrationTrendCard extends StatelessWidget {
  const HydrationTrendCard({super.key});

  Widget buildBar(String day, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 18,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(fontSize: 12),
        ),
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
              "Hydration Trend",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildBar("M", 70),
                  buildBar("T", 100),
                  buildBar("W", 80),
                  buildBar("T", 130),
                  buildBar("F", 90),
                  buildBar("S", 140),
                  buildBar("S", 110),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}