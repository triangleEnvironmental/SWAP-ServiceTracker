import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moderator_app/app/globals/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/index.dart';

import 'app/constants/index.dart';
import 'app/services/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependency().inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsService = Get.find<SettingsService>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    const forScreenshot = false;

    final app = GetMaterialApp(
      title: AppStrings.appName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: !forScreenshot,
      color: AppColors.primaryMaterialColor,
      supportedLocales: const [Locale('en'), Locale('km')],
      themeMode: settingsService.brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      locale: settingsService.locale,
      translationsKeys: AppTranslations().keys,
      fallbackLocale: AppValues.fallbackLocale,
      initialRoute: Routes.routeSplash,
      getPages: AppPages.routes,
    );

    if (!forScreenshot && AppStrings.apiUrl == AppStrings.devUrl) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Banner(
          message: 'Staging'.toUpperCase(),
          color: AppColors.primaryColor,
          location: BannerLocation.topStart,
          child: app,
        ),
      );
    } else {
      return app;
    }
  }
}
