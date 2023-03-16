import 'dart:developer';

import 'package:clean_todo/core/errors/exceptions.dart';
import 'package:clean_todo/features/preferences/data/models/preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/datasource/local_data_source.dart';

final preferencesLocalDataSourceProvider =
    FutureProvider<PreferencesLocalDataSource>((ref) async {
  var preferencesLocalDataSource = PreferencesLocalDataSourceImpl();
  await preferencesLocalDataSource.init();
  return preferencesLocalDataSource;
});

abstract class PreferencesLocalDataSource implements LocalDataSource {
  Future<PreferencesModel?> getPreferences();
  Future<void> savePreferences(PreferencesModel preferences);
}

class PreferencesLocalDataSourceImpl extends PreferencesLocalDataSource {
  late Box<PreferencesModel> box;

  @override
  Future<PreferencesModel?> getPreferences() async {
    try {
      return box.values.isEmpty ? null : box.values.first;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> savePreferences(PreferencesModel preferences) async {
    try {
      await box.put("preferences", preferences);
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> init() async {
    Hive.registerAdapter(PreferencesModelAdapter());
    box = await Hive.openBox("preferences");
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
