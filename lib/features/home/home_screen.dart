import 'package:flutter/material.dart';

import '../../widgets/custom_header.dart';
import '../../widgets/recommendation_card.dart';
import '../../widgets/quality_card.dart';
import '../../widgets/water_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              //---------------------------------------------------
              // Header
              //---------------------------------------------------

              const CustomHeader(
                userName: "Vivek",
              ),

              const SizedBox(height: 20),

              //---------------------------------------------------
              // Water Progress
              //---------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: WaterProgress(
                  current: 2.0,
                  goal: 3.5,
                ),
              ),

              const SizedBox(height: 20),

              //---------------------------------------------------
              // AI Recommendation
              //---------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RecommendationCard(
                  water: "Copper Water",
                  quantity: "250 ml",
                  confidence: 96,
                  reason:
                      "Morning hydration profile detected. Copper water is recommended.",
                ),
              ),

              const SizedBox(height: 20),

              //---------------------------------------------------
              // Water Quality
              //---------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: QualityCard(
                  ph: 7.2,
                  tds: 320,
                  temperature: 24.0,
                  turbidity: 0.3,
                ),
              ),

              const SizedBox(height: 25),

              //---------------------------------------------------
              // Dispense Button
              //---------------------------------------------------

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    icon: const Icon(Icons.local_drink),

                    label: const Text(
                      "Dispense Water",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}