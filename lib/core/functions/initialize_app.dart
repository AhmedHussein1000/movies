import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/core/cache/hive_helper.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/core/network/api_service.dart';
import 'package:flutter/material.dart';
Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  ApiService.init();
  await HiveHelper.init();
  await HiveHelper.clearExpiredCache();
  await dotenv.load(fileName: ".env");
}