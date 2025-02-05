import 'package:flutter/widgets.dart';
import 'package:to_win/l10n/app_localizations.dart'; // Make sure this import is correct based on your project structure

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}
