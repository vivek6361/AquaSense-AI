import 'package:flutter/material.dart';

class HydrationTrendCard extends StatelessWidget {
  const HydrationTrendCard({super.key});

  Widget buildBar(String day, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 24,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(day),
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

            const SizedBox(height: 20),

            SizedBox(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildBar("Mon", 70),
                  buildBar("Tue", 110),
                  buildBar("Wed", 90),
                  buildBar("Thu", 130),
                  buildBar("Fri", 95),
                  buildBar("Sat", 145),
                  buildBar("Sun", 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
