import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provipay/core/i18n/translations.g.dart';
import 'app.dart';
import 'flavors.dart';

const String flavor = String.fromEnvironment('FLAVOR');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.values.firstWhere(
    (e) => e.name == flavor,
    orElse: () => Flavor.dev,
  );

  LocaleSettings.useDeviceLocale();

  runApp(ProviderScope(child: TranslationProvider(child: const App())));
}
