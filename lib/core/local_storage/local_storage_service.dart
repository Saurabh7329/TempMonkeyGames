// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart' hide Key;
import 'package:freeplay/core/domain/configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static String? getString(String key) {
    return decrypt(_prefs.getString(key));
  }

  static int? getInt(String key) {
    return (_prefs.getInt(key));
  }

  static Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, _encrypt(value));
  }

  static Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, (value));
  }

  static Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }
  static Future clear({
    List<String> blacklist = const [],
  }) async {
    for (final key in _prefs.getKeys()) {
      if (blacklist.contains(key)) {
        await _prefs.remove(key);
      }
    }
  }
  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }
  static Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  static Set<String> getKeys() {
    return _prefs.getKeys();
  }
  static Object? get(String key) {
    return _prefs.get(key);
  }
  static String _encrypt(String plainText) {
    final key = Key.fromUtf8('vk*oV!x8NgQ*%9gxJ2qPKtCWFs4^qfF@');
    final iv = IV.allZerosOfLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }
  static String? decrypt(String? encryptedText) {
    if (encryptedText == null) {
      return null;
    }
    final key = Key.fromUtf8('vk*oV!x8NgQ*%9gxJ2qPKtCWFs4^qfF@');
    final iv = IV.allZerosOfLength(16);
    final encrypter = Encrypter(AES(key));
    final decrypted =
        encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
    return decrypted;
  }
  @visibleForTesting
  static void setMockInitialValues(Map<String, Object> values) {
    SharedPreferences.setMockInitialValues(values);
  }
  @visibleForTesting
  static String encrypt(String plainText) => _encrypt(plainText);

  static Future<bool> setConfiguration(String key, Configuration configuration) async {
    final configJson = jsonEncode(configuration.toJson());
    return _prefs.setString(key, _encrypt(configJson));
  }

  static Configuration? getConfiguration(String key) {
    final encryptedUserJson = _prefs.getString(key);
    if (encryptedUserJson == null) return null;
    final configJson = decrypt(encryptedUserJson);
    if (configJson == null) return null;
    Map<String, dynamic> configMap = jsonDecode(configJson);
    return Configuration.fromJson(configMap);
  }

  static Future<bool> setPublicConfiguration(String key, publicConfiguration configuration) async {
    final configJson = jsonEncode(configuration.toJson());
    return _prefs.setString(key, _encrypt(configJson));
  }


  static publicConfiguration? getPublicConfiguration(String key) {
    final encryptedUserJson = _prefs.getString(key);
    if (encryptedUserJson == null) return null;
    final configJson = decrypt(encryptedUserJson);
    if (configJson == null) return null;
    Map<String, dynamic> configMap = jsonDecode(configJson);
    return publicConfiguration.fromJson(configMap);
  }

  static Future<bool> setBannerPromotion(String key, Promotion promotion) async {
    final promotionJson = jsonEncode(promotion.toJson());
    return _prefs.setString(key, _encrypt(promotionJson));
  }

  static Promotion? getBannerPromotion(String key) {
    final encryptedUserJson = _prefs.getString(key);
    if (encryptedUserJson == null) return null;
    final promotionJson = decrypt(encryptedUserJson);
    if (promotionJson == null) return null;
    Map<String, dynamic> promotionMap = jsonDecode(promotionJson);
    return Promotion.fromJson(promotionMap);
  }
}



