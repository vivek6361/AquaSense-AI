import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  Widget buildCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBar(String day, double value) {
    return Column(
      children: [
        Container(
          width: 22,
          height: value,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 6),
        Text(day),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),

      appBar: AppBar(
        title: const Text("Analytics"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Hydration Overview",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: buildCard(
                    icon: Icons.water_drop,
                    title: "Today's Intake",
                    value: "2.0 L",
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: buildCard(
                    icon: Icons.flag,
                    title: "Daily Goal",
                    value: "3.5 L",
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            buildCard(
              icon: Icons.favorite,
              title: "Hydration Score",
              value: "92%",
              color: Colors.green,
            ),

            const SizedBox(height: 25),

            const Text(
              "Weekly Intake",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildBar("M", 60),
                    buildBar("T", 90),
                    buildBar("W", 70),
                    buildBar("T", 110),
                    buildBar("F", 80),
                    buildBar("S", 120),
                    buildBar("S", 95),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "AI Recommendation Statistics",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [

                    ListTile(
                      leading: Icon(
                        Icons.psychology,
                        color: Colors.green,
                      ),
                      title: Text("Copper Water"),
                      trailing: Text("12"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(
                        Icons.water_drop,
                        color: Colors.blue,
                      ),
                      title: Text("Mineral Water"),
                      trailing: Text("8"),
                    ),

                    Divider(),

                    ListTile(
                      leading: Icon(
                        Icons.spa,
                        color: Colors.orange,
                      ),
                      title: Text("Alkaline Water"),
                      trailing: Text("5"),
                    ),
                  ],
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