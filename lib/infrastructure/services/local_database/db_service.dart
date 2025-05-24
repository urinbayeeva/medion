import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medion/domain/common/token.dart';

class DBService {
  static const _dbName = 'localDB';
  static const _accessToken = 'access_token';
  static const _uid = 'uid';
  static const _refreshToken = 'refresh_token';
  static const _themeMode = 'theme_mode';
  static const _language = 'language';
  static const _currencyPreference = 'currency_preference';
  static const intro = 'intro';
  static const prediction = 'prediction';
  static const auction = 'auction';
  static const auctionMarket = 'auction_market';
  static const business = 'business';
  static const auctionTerms = 'auction_terms';
  static const auctionBusiness = 'auction_business';
  static const auctionConsumer = 'auction_consumer';
  static const diagnostics = 'diagnostics';
  static const _tokenType = "token_type";

  static Box? _box;

  DBService._();

  static Future<DBService> get create async {
    _box ??= await Hive.openBox(_dbName);

    bool? isFirstLaunch = _box?.get('first_launch', defaultValue: true);

    if (isFirstLaunch == true) {
      await _box?.clear();
      await _box?.put('first_launch', false);
    }

    return DBService._();
  }

  Future<void> clearAllData() async {
    await _box?.clear();
  }

  /// Token
  Future<void> setToken(Token token) async {
    await _box?.put(_accessToken, token.accessToken ?? '');
    await _box?.put(_refreshToken, token.refreshToken ?? '');
  }

  Token get token {
    final accessToken = _box?.get(_accessToken);
    final refreshToken = _box?.get(_refreshToken);
    return Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: "Bearer",
    );
  }

  /// UID
  Future<void> setUid(String? uid) async {
    await _box?.put(_uid, uid);
  }

  String? get getUid {
    final uid = _box?.get(_uid);
    return uid;
  }

  /// Currency Preference
  Future<void> setCurrencyPreference(bool isUzs) async {
    await _box?.put(_currencyPreference, isUzs);
  }

  bool get getCurrencyPreference {
    return _box?.get(_currencyPreference, defaultValue: false) as bool;
  }

  /// Theme Mode
  Future<void> setThemeMode(String? mode) async {
    await _box?.put(_themeMode, mode);
  }

  String? get getThemeMode {
    String? getName = _box?.get(_themeMode);
    return getName;
  }

  Future<void> signOut() async {
    bool? langSaved = getLang;
    // await clearAllData();
    setLang(isSaved: langSaved ?? false);
  }

  /// Language
  Future<void> setLang({bool isSaved = false}) async {
    await _box?.put(_language, isSaved);
  }

  Future<void> setUserLanguage(String languageCode) async {
    await _box?.put(_language, languageCode);
  }

  bool? get getLang {
    bool? language = _box?.get(_language, defaultValue: false);
    return language;
  }

  Future<void> setBool({required String key, bool isSaved = false}) async {
    await _box?.put(key, isSaved);
  }

  bool? getBool({required String key}) {
    final bool? result = _box?.get(key, defaultValue: false);
    return result;
  }

  String getUserLanguage() {
    return _box?.get(_language, defaultValue: 'ru') as String;
  }

  static ValueListenable<Box> listenable() {
    return Hive.box(_dbName).listenable();
  }

  bool isTokenExpired(String accessToken) {
    final payload = accessToken.split('.')[1];
    final decodedPayload =
        utf8.decode(base64Url.decode(base64.normalize(payload)));
    final exp = jsonDecode(decodedPayload)['exp'];
    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return DateTime.now().isAfter(expiryDate);
  }
}
