import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'screens/home.dart';
import 'screens/podcasts.dart';
import 'screens/generic.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: "/search",
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: 'search',
      path: '/search',
      builder: (BuildContext context, GoRouterState state) {
        return const GenericScreen(name: "search");
      },
    ),
    GoRoute(
      name: 'podcasts',
      path: '/podcasts',
      builder: (BuildContext context, GoRouterState state) {
        return const PodcastsScreen();
      },
    ),
    GoRoute(
      name: 'wallet',
      path: '/wallet',
      builder: (BuildContext context, GoRouterState state) {
        return const GenericScreen(name: "wallet");
      },
    ),
    GoRoute(
      name: 'profile',
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const GenericScreen(name: "profile");
      },
    ),
    GoRoute(
      name: 'podcasts-show',
      path: '/podcasts/:showId',
      builder: (context, state) => GenericScreen(
        name: 'podcasts',
        id: state.pathParameters["showId"]!,
        back: "/podcasts",
      ),
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xffffe6a4),
          secondary: Color(0xffC1C2C5),
          onBackground: Color(0xff282828),
        ),
      ),
      routerConfig: _router,
    );
  }
}
