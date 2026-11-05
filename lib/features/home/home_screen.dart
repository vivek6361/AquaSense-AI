import 'package:flutter/material.dart';
import '../../widgets/header/premium_header.dart';
import '../../widgets/cards/hydration_score_card.dart';
import '../../widgets/cards/ai_recommendation_card.dart';
import '../../widgets/cards/water_quality_card.dart';
import '../../widgets/cards/device_status_card.dart';
import '../../widgets/cards/quick_actions_card.dart';
import '../../widgets/cards/recent_activity_card.dart';
import '../../widgets/common/device_action_notice.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.userName = 'Welcome', this.onNavigate});
  final String userName;
  final ValueChanged<int>? onNavigate;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: ListView(
      key: const PageStorageKey('home-scroll'),
      padding: const EdgeInsets.all(20),
      children: [
        PremiumHeader(userName: userName),
        const SizedBox(height: 20),
        Text('Your daily overview', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const HydrationScoreCard(score: 96, status: 'Sample score'),
        const SizedBox(height: 20),
        const AIRecommendationCard(
          waterType: 'Copper Water', quantity: '250 ml', confidence: 96,
          reason: 'Example morning recommendation from the original prototype. This is not a measurement of your hydration or a medical recommendation.',
        ),
        const SizedBox(height: 20),
        Text('Water & purifier', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const WaterQualityCard(ph: 7.2, tds: 320, temperature: 24, turbidity: 0.3),
        const SizedBox(height: 16),
        const DeviceStatusCard(connected: true, filterHealth: 94, tankLevel: 82, pumpStatus: 'Sample'),
        const SizedBox(height: 20),
        if (onNavigate != null) QuickActionsCard(onNavigate: onNavigate!),
        const SizedBox(height: 20),
        const RecentActivityCard(),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => showDeviceActionNotice(context),
          icon: const Icon(Icons.water_drop_outlined),
          label: const Text('Dispense water'),
        ),
        const SizedBox(height: 12),
      ],
    )),
  );
}
