import 'package:flutter/material.dart';

import '../../widgets/custom_header.dart';
import '../../widgets/recommendation_card.dart';
import '../../widgets/quality_card.dart';
import '../../widgets/water_progress.dart';
import '../../widgets/cards/hydration_score_card.dart';
import '../../widgets/cards/ai_recommendation_card.dart';
import '../../widgets/cards/water_quality_card.dart';
import '../../widgets/cards/device_status_card.dart';
import '../../widgets/cards/quick_actions_card.dart';
import '../../widgets/cards/recent_activity_card.dart';
import '../../widgets/header/premium_header.dart';

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

              const PremiumHeader(
                userName: "Vivek",
              ),
              const SizedBox(height: 20),

              //---------------------------------------------------
              // Water Progress
              //---------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HydrationScoreCard(
                  score: 96,
                  status: "Excellent",
                ),
              ),

              const SizedBox(height: 20),

              //---------------------------------------------------
              // AI Recommendation
              //---------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AIRecommendationCard(
                  waterType: "Copper Water",
                  quantity: "250 ml",
                  confidence: 96,
                  reason:
                      "Morning hydration detected. Yesterday's intake was below your daily goal.",
                ),
              ),

              const SizedBox(height: 20),

              //---------------------------------------------------
              // Water Quality
              //---------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: WaterQualityCard(
                  ph: 7.2,
                  tds: 320,
                  temperature: 24,
                  turbidity: 0.3,
                ),
              ),
              const SizedBox(height: 25),

              //device status
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DeviceStatusCard(
                  connected: true,
                  filterHealth: 94,
                  tankLevel: 82,
                  pumpStatus: "Ready",
                ),
              ),
              // quick quick_actions_card
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: QuickActionsCard(),
              ),
              //recent activity
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RecentActivityCard(),
              ),

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