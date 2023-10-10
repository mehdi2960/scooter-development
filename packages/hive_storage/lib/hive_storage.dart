library hive_storage;

import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  HiveStorage._();

  late Box<dynamic> _box;

  static final HiveStorage instance = HiveStorage._();

  Future<void> initialize({String? boxName}) async {
    await Hive.initFlutter();
    _box = await Hive.openBox(boxName ?? 'storage');
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  dynamic get(String key) {
    return _box.get(key);
  }

  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }
}
