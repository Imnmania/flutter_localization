import 'package:flutter/material.dart';
import 'package:flutter_localization_app/Localization/demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValues(key);
}

// language code
const String ENGLISH = 'en';
const String BANGLA = 'bn';