import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/core/routes/app_router.dart';
import 'package:pulseboard/core/routes/app_router.gr.dart';
import 'package:pulseboard/presentation/pages/dashboard/dashboard_page.dart';
import 'package:pulseboard/presentation/pages/settings/settings_page.dart';

void main() {
  late AppRouter router;

  setUp(() {
    router = AppRouter();
  });

  Future<void> _pumpMainMenu(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routerDelegate: AutoRouterDelegate(router),
          routeInformationParser: router.defaultRouteParser(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('MainMenuPage', () {
    testWidgets('displays bottom navigation bar with correct items', (
      tester,
    ) async {
      await _pumpMainMenu(tester);

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byIcon(Icons.dashboard_outlined), findsOneWidget);
      expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('displays AutoTabsScaffold with correct routes', (
      tester,
    ) async {
      await _pumpMainMenu(tester);

      expect(find.byType(AutoTabsScaffold), findsOneWidget);

      final autoTabsScaffold = tester.widget<AutoTabsScaffold>(
        find.byType(AutoTabsScaffold),
      );
      expect(autoTabsScaffold.routes?.length, 2);
      expect(autoTabsScaffold.routes?[0], isA<DashboardRoute>());
      expect(autoTabsScaffold.routes?[1], isA<SettingsRoute>());
    });

    testWidgets('has correct transition animation', (tester) async {
      await _pumpMainMenu(tester);

      final autoTabsScaffold = tester.widget<AutoTabsScaffold>(
        find.byType(AutoTabsScaffold),
      );
      expect(autoTabsScaffold.transitionBuilder, isNotNull);

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(FadeTransition), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('switches between tabs when bottom navigation item is tapped', (
      tester,
    ) async {
      await _pumpMainMenu(tester);

      expect(find.byType(DashboardPage), findsOneWidget);

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);

      await tester.tap(find.byIcon(Icons.dashboard_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardPage), findsOneWidget);
    });

    testWidgets('maintains correct navigation state', (tester) async {
      await _pumpMainMenu(tester);

      BottomNavigationBar bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 0);

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 1);
    });

    testWidgets('has correct navigation bar styling', (tester) async {
      await _pumpMainMenu(tester);

      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(bottomNavBar.items.length, 2);
      expect(bottomNavBar.items[0].icon, isA<Icon>());
      expect(bottomNavBar.items[0].label, 'Dashboard');
      expect(bottomNavBar.items[1].icon, isA<Icon>());
      expect(bottomNavBar.items[1].label, 'Settings');
    });
  });
}
