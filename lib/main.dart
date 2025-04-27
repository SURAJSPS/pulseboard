import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/domain/di/app_providers.dart';
import 'core/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Wrap the app with ProviderScope for Riverpod
    ProviderScope(
      //  observers: [routerProvider],
      
      
      child: PulseBoardApp()),
  );
}

class PulseBoardApp extends ConsumerWidget {
  PulseBoardApp({super.key});

  // Create router instance
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final appRouter = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'PulseBoard',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   useMaterial3: true,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     centerTitle: true,
      //   ),
      // ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
