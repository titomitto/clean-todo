import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/features/preferences/data/models/preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'preferences_local_datasource.dart';

final preferencesLocalDataSourceProvider =
    FutureProvider.autoDispose<PreferencesLocalDataSource>((ref) async {
  Box<PreferencesModel> box = await Hive.openBox("preferences");
  var preferencesLocalDataSource = PreferencesLocalDataSourceImpl(box);

  ref.onDispose(() async {
    await preferencesLocalDataSource.close();
    log("preferencesLocalDataSourceProvider disposed");
  });

  return preferencesLocalDataSource;
});

class PreferencesLocalDataSourceImpl extends PreferencesLocalDataSource {
  late Box<PreferencesModel> box;
  PreferencesLocalDataSourceImpl(this.box);
  @override
  Future<PreferencesModel> getPreferences() async {
    try {
      return box.values.isEmpty ? PreferencesModel() : box.values.first;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> setLanguage(String language) async {
    try {
      PreferencesModel preferences = await getPreferences();
      await box.put(
        "preferences",
        preferences.copyWith(
          language: language,
        ),
      );
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> setThemeMode(String themeMode) async {
    try {
      PreferencesModel preferences = await getPreferences();
      await box.put(
        "preferences",
        preferences.copyWith(
          themeMode: themeMode,
        ),
      );
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  Future<void> close() async {
    await box.close();
  }
}
