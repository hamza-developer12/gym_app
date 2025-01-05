import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  // Private constructor
  StorageServices._privateConstructor();

  // Singleton instance
  static final StorageServices _instance =
      StorageServices._privateConstructor();

  // Factory method to provide access to the instance
  factory StorageServices() {
    return _instance;
  }

  // Shared preferences instance
  late SharedPreferences sharedPre;

  // Initialize shared preferences
  Future<void> init() async {
    sharedPre = await SharedPreferences.getInstance();
    print("Initialized Successfully");
  }

  // Example method to demonstrate functionality
  Future<void> saveData(String key, String value) async {
    sharedPre.setString(key, value);
  }

  Future<String?> getData(String key) async {
    return sharedPre.getString(key);
  }

  Future<void> removeData() async {
    sharedPre.remove('role');
  }
}
