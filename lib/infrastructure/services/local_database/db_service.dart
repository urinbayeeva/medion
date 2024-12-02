import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/infrastructure/repository/calendar_repo.dart';

class DBService {
  static const _dbName = 'localDB';
  static const _accessToken = 'access_token';
  static const _uid = 'uid';
  static const _refreshToken = 'refresh_token';
  static const _themeMode = 'theme_mode';
  static const _language = 'language';

  static Box? _box;

  DBService._();

  static Future<DBService> get create async {
    _box ??= await Hive.openBox(_dbName);
    return DBService._();
  }

  /// Token
  Future<void> setToken(Token token) async {
    await _box?.put(_accessToken, token.accessToken ?? '');
    await _box?.put(_refreshToken, token.refreshToken ?? '');
  }

  Token get token {
    final accessToken = _box?.get(_accessToken);
    final refreshToken = _box?.get(_refreshToken);
    return Token(accessToken: accessToken, refreshToken: refreshToken);
  }

  /// UID
  Future<void> setUid(String? uid) async {
    await _box?.put(_uid, uid);
  }

  String? get getUid {
    final uid = _box?.get(_uid);
    return uid;
  }

  /// Lang
  Future<void> setLang({bool isSaved = false}) async {
    await _box?.put(_language, isSaved);
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

  static ValueListenable<Box> listenable() {
    return Hive.box(_dbName).listenable();
  }

  Future<void> setThemeMode(String? mode) async {
    await _box?.put(_themeMode, mode);
  }

  String? get getThemeMode {
    String? getName = _box?.get(_themeMode);
    return getName;
  }

  Future<void> signOut() async {
    bool? langSaved = getLang;
    await _box?.clear();
    setLang(isSaved: langSaved ?? false);
  }
}

class LocalCalendarRepository implements CalendarRepository {
  final HiveInterface hive;
  LocalCalendarRepository(this.hive);

  @override
  Future<List<DateTime>> getEventDates() async {
    return hive.box('calendar').get('eventDates') ?? [];
  }

  @override
  Future<void> saveSelectedDate(DateTime date) async {
    hive.box('calendar').put('selectedDate', date);
  }

  @override
  DateTime getSelectedDate() {
    return hive.box('calendar').get('selectedDate') ?? DateTime.now();
  }
}
