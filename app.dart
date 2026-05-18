import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provipay/core/design_system/app_theme.dart';
import 'package:provipay/core/design_system/theme_provider.dart';
import 'package:provipay/core/i18n/translations.g.dart';
import 'package:provipay/core/services/inactivity_service.dart';
import 'flavors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return InactivityWrapper(
          child: MaterialApp(
            title: F.title,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: _flavorBanner(child: const HomePage(), show: kDebugMode),
          ),
        );
      },
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name.toUpperCase(),
          color: Colors.green.withAlpha(150),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : child;
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.common.welcome,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              "Current Flavor: ${F.name.toUpperCase()}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
