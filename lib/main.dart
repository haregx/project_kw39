import 'package:flutter/material.dart';
import 'package:project_kw39/constants/routes.dart';

void main() {
  runApp(const KW39App());
}

class KW39App extends StatelessWidget {
  const KW39App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: AppRouter.routerConfig,
    );
  }
}


