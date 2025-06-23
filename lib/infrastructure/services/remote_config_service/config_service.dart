import 'dart:developer';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:medion/infrastructure/services/remote_config_service/remote_config_keys.dart';

class RemoteConfigService {
  static Future<void> setupRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 2),
      minimumFetchInterval: const Duration(seconds: 2),
    ));
    await remoteConfig.setDefaults(
      {
        for (final key in RemoteConfigKeys.keys) key: false,
      },
    );
  }

  static Future<void> fetchRemoteConfig() async {
    log("called remote config");
    final remoteConfig = FirebaseRemoteConfig.instance;
    try {
      await remoteConfig.fetchAndActivate();
      log('Remote Config fetched and activated');
    } catch (e) {
      log('Failed to fetch remote config: $e');
    }
  }
}
