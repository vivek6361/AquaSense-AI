import 'package:flutter/material.dart';

class QualityCard extends StatelessWidget {
  final double ph;
  final int tds;
  final double temperature;
  final double turbidity;

  const QualityCard({
    super.key,
    required this.ph,
    required this.tds,
    required this.temperature,
    required this.turbidity,
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
          children: [

            const Row(
              children: [

                Icon(
                  Icons.water_drop,
                  color: Colors.blue,
                  size: 28,
                ),

                SizedBox(width: 10),

                Text(
                  "Live Water Quality",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: _sensorTile(
                    "pH",
                    ph.toString(),
                    Icons.science,
                    Colors.orange,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _sensorTile(
                    "TDS",
                    "$tds ppm",
                    Icons.opacity,
                    Colors.blue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: _sensorTile(
                    "Temperature",
                    "${temperature.toStringAsFixed(1)}°C",
                    Icons.thermostat,
                    Colors.red,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _sensorTile(
                    "Turbidity",
                    turbidity.toString(),
                    Icons.blur_on,
                    Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sensorTile(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: color,
            size: 32,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}