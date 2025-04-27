// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:pulseboard/domain/entities/sensor.dart' as _i7;
import 'package:pulseboard/presentation/pages/dashboard/dashboard_page.dart'
    as _i1;
import 'package:pulseboard/presentation/pages/details/details_page.dart' as _i2;
import 'package:pulseboard/presentation/pages/main_menu/main_menu_page.dart'
    as _i3;
import 'package:pulseboard/presentation/pages/settings/settings_page.dart'
    as _i4;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i6.Key? key,
    required _i7.Sensor sensor,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(key: key, sensor: sensor),
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i2.DetailsScreen(key: args.key, sensor: args.sensor);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.sensor});

  final _i6.Key? key;

  final _i7.Sensor sensor;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, sensor: $sensor}';
  }
}

/// generated route for
/// [_i3.MainMenuPage]
class MainMenuRoute extends _i5.PageRouteInfo<void> {
  const MainMenuRoute({List<_i5.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainMenuPage();
    },
  );
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsPage();
    },
  );
}
