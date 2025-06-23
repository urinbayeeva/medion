import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/infrastructure/services/remote_config_service/config_service.dart';
import 'package:medion/infrastructure/services/remote_config_service/remote_config_keys.dart';

part 'locale_event.dart';

part 'locale_state.dart';

part 'locale_bloc.freezed.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  LocaleBloc() : super(const LocaleState()) {
    on<_Update>((event, emit) => _onRemoteConfigUpdated(event, emit));
    on<_Initialize>((event, emit) => _onRemoteConfigInitialized(event, emit));

    _remoteConfig.onConfigUpdated.listen((event) async {
      debugPrint("on Config updated keys ()=> ${event.updatedKeys} \n\n");
      _remoteConfig.activate();
      add(LocaleEvent.update(updatedKeys: event.updatedKeys));
    });
  }

  void _onRemoteConfigUpdated(_Update event, Emitter<LocaleState> emit) {
    final updatedKeys = event.updatedKeys;
    if (updatedKeys == null || updatedKeys.isEmpty) {
      return;
    }
    debugPrint("Received update: $updatedKeys");

    final fetchers = {
      // RemoteConfigKeys.poa: () => _decodeJson(remoteConfig.getString(RemoteConfigKeys.poa)),
      RemoteConfigKeys.bannerIsAvailable: () => _remoteConfig.getBool(RemoteConfigKeys.bannerIsAvailable),
    };

    final updatedValues = <String, dynamic>{};

    for (var key in updatedKeys) {
      if (fetchers.containsKey(key)) {
        updatedValues[key] = fetchers[key]!();
      }
    }

    if (updatedValues.isEmpty) {
      debugPrint("No relevant remote config keys were updated.");
      return;
    }

    for (var key in updatedKeys) {
      debugPrint("key: $key, value: ${updatedValues[key]}");
    }

    emit(
      state.copyWith(
        // poa: updatedValues[RemoteConfigKeys.poa] != null
        //     ? GarageConfigModel.fromJson(updatedValues[RemoteConfigKeys.poa])
        //     : null,
        bannerIsAvailable: updatedValues[RemoteConfigKeys.bannerIsAvailable],
      ),
    );
  }

  void _onRemoteConfigInitialized(_Initialize event, Emitter<LocaleState> emit) async {
    try {
      debugPrint("_onRemoteConfigInitialized");
      await RemoteConfigService.setupRemoteConfig();
    } catch (e) {
      debugPrint("_onRemoteConfigInitialized error: $e");
    }

    await RemoteConfigService.fetchRemoteConfig();

    add(const _Update(updatedKeys: {...RemoteConfigKeys.keys}));
  }

  Map<String, dynamic>? _decodeJson(String jsonString) {
    if (jsonString.isEmpty) return null;
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      debugPrint("Failed to decode JSON: $e");
      return null;
    }
  }
}
