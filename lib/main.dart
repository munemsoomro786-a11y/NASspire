import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/app_router.dart';
import 'core/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: NASspireApp(),
    ),
  );
}

class NASspireApp extends StatelessWidget {
  const NASspireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NASspire E-Learning',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
