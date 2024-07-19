import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spacexdata/views/home.dart';
import 'package:spacexdata/views/launch/launchDetail.dart';
import 'package:spacexdata/views/launch/launchList.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/launches',
          builder: (context, state) => LaunchListScreen(),
        ),
        GoRoute(
          path: '/launches/:index',
          builder: (context, state) {
            final index = int.parse(state.pathParameters['index']!);
            return LaunchDetailScreen(launchIndex: index);
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      title: 'SpaceX Launches',
    );
  }
}
