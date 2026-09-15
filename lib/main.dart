import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// Suppresses the draggable Material scrollbar that Flutter's default
/// desktop/web scroll behavior overlays on scrollable content — the
/// design has no visible scroll indicator.
class _NoScrollbarBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UICT Online Attendance',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      scrollBehavior: _NoScrollbarBehavior(),
      home: const LoginScreen(),
    );
  }
}