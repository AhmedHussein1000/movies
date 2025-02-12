import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/core/cache/hive_helper.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/core/network/api_service.dart';
import 'package:movies_app/core/routes/app_router.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/core/themes/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  ApiService.init();
  await getIt.get<HiveHelper>().init();
  await getIt.get<HiveHelper>().clearExpiredCache();
  await dotenv.load(fileName: ".env");
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
