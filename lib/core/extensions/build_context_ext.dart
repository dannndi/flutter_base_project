import 'package:base_project/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get intl => AppLocalizations.of(this)!;
}
