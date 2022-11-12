import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:household_expenses_app/app.dart';
import 'package:household_expenses_app/common/hive_use_case.dart';

void main() async {
  WidgetsFlutterBinding().ensureVisualUpdate();
  await EasyLocalization.ensureInitialized();
  await HiveUseCase().init();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('zh'),
          Locale('ja'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale(
          'en',
        ),
        child: App(),
      ),
    ),
  );
}
