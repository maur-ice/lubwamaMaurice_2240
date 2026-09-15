import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

<<<<<<< HEAD
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

=======
>>>>>>> 9a3fef343dff0c239964b9b7a5b9b2a2490e37ad
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'UICT Online Attendance',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      scrollBehavior: _NoScrollbarBehavior(),
      home: const LoginScreen(),
    );
  }
}
=======
      title: 'Lubwama Maurice App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
>>>>>>> 9a3fef343dff0c239964b9b7a5b9b2a2490e37ad
