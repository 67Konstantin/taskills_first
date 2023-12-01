import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskills_first/localisation/app_localizations.dart';
import 'package:taskills_first/taskills_application.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocalizationProvider(),
      child: MyApp(),
    ),
  );
}

