import 'package:flutter/material.dart';
import 'package:flutter_localization_app/Localization/demo_localization.dart';
import 'package:flutter_localization_app/routes/custom_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './routes/custom_router.dart';
import './routes/route_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  //## this is localization function
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: _locale,
      // Language and Country codes
      supportedLocales: [
        Locale('en', 'US'),
        Locale('bn', 'BD')
      ],
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }

        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,

    );
  }
}
