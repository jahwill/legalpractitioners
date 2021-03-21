import 'package:flutter/material.dart';
import 'package:legalpractitioners/domain/auth/login_and_routepage.dart';

import 'package:legalpractitioners/themeapp/apptheme.dart';
import 'package:legalpractitioners/exportedfiles.dart';

import 'components/animate_page.dart';
import 'package:provider/provider.dart';

import 'domain/auth/validate_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ValidateField>(
          create: (_) => ValidateField(),
        ),
        ChangeNotifierProvider<LogInandRoutePage>(
          create: (context) => LogInandRoutePage(),
        )
      ],
      // create: (context) => ValidateField(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: CustomScrollConfig(),
              child: child,
            );
          },
          title: 'Legal Practitioners',
          theme:
              ThemeApp.themeData().copyWith(platform: TargetPlatform.android),
          home: LogIn()),
    );
  }
}

class CustomScrollConfig extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
