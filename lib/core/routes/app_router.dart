import 'package:auto_route/auto_route.dart';
import 'package:pulseboard/core/routes/app_router.gr.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     AutoRoute(page: SensorDashboardPage, initial: true),
//     // Other routes...
//   ],
// )
// class $AppRouter {}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainMenuRoute.page,
      initial: true,
      children: [
        AutoRoute(page: DashboardRoute.page, children: []),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),

    AutoRoute(page: DetailsRoute.page, fullscreenDialog: true),
  ];
}
