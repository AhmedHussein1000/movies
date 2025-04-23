import 'package:flutter/material.dart';

import 'package:movies_app/core/functions/initialize_app.dart';
import 'package:movies_app/core/routes/app_router.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/themes/dark_theme.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.homeMoviesScreen,
      theme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
