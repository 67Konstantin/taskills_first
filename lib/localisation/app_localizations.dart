import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get hello => locale.languageCode == 'ru' ? 'Привет' : 'Hello';

  String get strName =>
      locale.languageCode == 'ru' ? 'Полное имя' : 'Full Name';
  String get strEmail => locale.languageCode == 'ru' ? 'Email' : 'Email';
  String get strPassword => locale.languageCode == 'ru' ? 'Пароль' : 'Password';
  String get strConfirmPassword =>
      locale.languageCode == 'ru' ? 'Подтвердите пароль' : 'Confirm Password';
  String get strAcquainted => locale.languageCode == 'ru'
      ? 'Привет! \n Давай знакомиться'
      : 'Hello! \n Let\'s get acquainted';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', ''); // Установите язык по умолчанию

  Locale get locale => _locale;

  void toggleLocale() {
    _locale = _locale.languageCode == 'en'
        ? const Locale('ru', '') // Переключение между языками
        : const Locale('en', '');

    notifyListeners(); // Уведомляем слушателей об изменении локали
  }
}
