import 'package:flutter/material.dart';

class AIInsightsCard extends StatelessWidget {
  const AIInsightsCard({super.key});

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
          children: const [

            Text(
              "AI Insights",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.green),
              title: Text("Morning hydration improved by 12%"),
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.water_drop, color: Colors.blue),
              title: Text("Copper Water recommended 68% of the time"),
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.orange),
              title: Text("Drink 300 ml before 9 AM tomorrow"),
            ),
          ],
        ),
      ),
    );
  }
}