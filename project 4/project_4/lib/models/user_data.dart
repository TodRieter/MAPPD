import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static SharedPreferences? _preferences;
  static const _keyUsername = 'username';
  static const _keyDoB = 'DateOfBirth';
  static const _keyFavoriteUnreadBook = 'FavoriteUnreadBook';
  static const _keyExpandByDefault = 'ExpandByDefault';
  static const _keyFilterRussellPosts = 'FilterRussellPosts';
  @override
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences?.setString(_keyUsername, username);

  static String getUsername() => _preferences?.getString(_keyUsername) ?? "";

  static Future setDateOfBirth(String DoB) async =>
      await _preferences?.setString(_keyDoB, DoB);

  static String getDateOfBirth() => _preferences?.getString(_keyDoB) ?? "";

  static Future setFavoriteUnreadBook(String unreadBook) async =>
      await _preferences?.setString(_keyFavoriteUnreadBook, unreadBook);

  static String getFavoriteUnreadBook() =>
      _preferences?.getString(_keyFavoriteUnreadBook) ?? "";

  static Future setExpandByDefault(bool expandByDefault) async =>
      await _preferences?.setBool(_keyExpandByDefault, expandByDefault);

  static bool getExpandByDefault() =>
      _preferences?.getBool(_keyExpandByDefault) ?? false;

  static Future setFilterRussellPosts(bool filterRussellPosts) async =>
      await _preferences?.setBool(_keyFilterRussellPosts, filterRussellPosts);

  static bool getFilterRussellPosts() =>
      _preferences?.getBool(_keyFilterRussellPosts) ?? false;
}
