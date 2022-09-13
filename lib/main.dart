// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mbook2/core/localization/applocalization.dart';
import 'package:mbook2/core/app%20route/approute.dart';
import 'package:mbook2/core/localization/localization_shared_prefrencess/localization_sharedpref.dart';
import 'core/dpendency injection/dpendency.dart' as di;

late String locale;
void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await di.init();

  locale = await LocalizationSharedPreferncess.LocalizationsString();
  runApp(MyApp(
    approute: AppRoute(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRoute approute;
  const MyApp({Key? key, required this.approute}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MBook',
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
         for (var locale in supportedLocales){if (deviceLocale != null  && deviceLocale.languageCode == locale.languageCode)
         {return deviceLocale ; }}return supportedLocales.first ;

       // return Locale(locale);
      },
      onGenerateRoute: widget.approute.onGenerateRoute,
    );
  }
}
