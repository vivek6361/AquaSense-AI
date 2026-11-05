import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aquasense_flutter/core/theme/app_theme.dart';
import 'package:aquasense_flutter/features/navigation/navigation_screen.dart';

void main() {
  testWidgets('Dashboard uses signed-in name and shortcuts switch tabs', (tester) async {
    await tester.pumpWidget(MaterialApp(theme: AppTheme.lightTheme,
      home: const NavigationScreen(userName: 'Test user')));
    expect(find.text('Test user'), findsOneWidget);
    expect(find.text('AQVYNTRA'), findsOneWidget);
    await tester.ensureVisible(find.widgetWithText(ActionChip, 'Device'));
    await tester.tap(find.widgetWithText(ActionChip, 'Device'));
    await tester.pumpAndSettle();
    expect(find.text('AQVYNTRA X1'), findsOneWidget);
    await tester.ensureVisible(find.text('Restart Device'));
    await tester.tap(find.text('Restart Device'));
    await tester.pumpAndSettle();
    expect(find.text('Device connection needed'), findsOneWidget);
    await tester.tap(find.text('Got it'));
    await tester.pumpAndSettle();
    expect(find.text('Device connection needed'), findsNothing);
  });

  testWidgets('Wide layouts retain all five destinations', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(theme: AppTheme.lightTheme,
      home: const NavigationScreen(userName: 'Test user')));
    expect(find.byType(NavigationRail), findsOneWidget);
    await tester.tap(find.descendant(of: find.byType(NavigationRail), matching: find.text('Profile')));
    await tester.pumpAndSettle();
    expect(find.text('Sign out'), findsOneWidget);
  });
}
