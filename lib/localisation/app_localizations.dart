import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String get strEmail => locale.languageCode == 'ru' ? 'Почта' : 'Email';
  String get strPassword => locale.languageCode == 'ru' ? 'Пароль' : 'Password';
  String get strConfirmPassword =>
      locale.languageCode == 'ru' ? 'Подтвердите пароль' : 'Confirm Password';
  String get strAcquainted => locale.languageCode == 'ru'
      ? 'Привет! \n Давай знакомиться'
      : 'Hello! \n Let\'s get acquainted';
  String get strSignUp =>
      locale.languageCode == 'ru' ? 'Зарегестрироваться' : 'Sign Up';
  String get strSignIn => locale.languageCode == 'ru' ? 'Войти' : 'Sign In';
  String get strAlreadyHaveAccount => locale.languageCode == 'ru'
      ? 'Уже есть аккакунт? Войдите!'
      : 'Already have an account? Sign in!';
  String get strChangeLanguage =>
      locale.languageCode == 'ru' ? 'Change Language' : 'Поменять язык';
  String get strLoginToContinue => locale.languageCode == 'ru'
      ? 'Войдите, чтобы \n продолжить'
      : 'Login \n to Continue';
  String get strNoAccountSignUp => locale.languageCode == 'ru'
      ? 'Нет аккаунта? Зарегистрируйтесь!'
      : 'No account? Sign up!';
  String get strValidateSignUp => locale.languageCode == 'ru'
      ? 'Пароль и подтверждение пароля не совпадают или некоторые поля введены некорректно'
      : 'The password and password confirmation do not match or some fields are entered incorrectly';
  String get strValidateSignIn => locale.languageCode == 'ru'
      ? 'Некоторые поля введены некорректно'
      : 'Some fields are entered incorrectly';
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
  late SharedPreferences _prefs;
  Locale _locale = const Locale('ru', ''); // Установите язык по умолчанию

  LocalizationProvider() {
    _loadLocale();
  }

  Locale get locale => _locale;

  Future<void> _loadLocale() async {
    _prefs = await SharedPreferences.getInstance();
    final savedLocale = _prefs.getString('locale');
    if (savedLocale != null) {
      _locale = Locale(savedLocale, '');
      notifyListeners();
    }
  }

  void _saveLocale() {
    _prefs.setString('locale', _locale.languageCode);
  }

  void toggleLocale() {
    _locale = _locale.languageCode == 'en'
        ? const Locale('ru', '')
        : const Locale('en', '');
    _saveLocale();
    notifyListeners(); // Уведомляем слушателей об изменении локали
  }
}
