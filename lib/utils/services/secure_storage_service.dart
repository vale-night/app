import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final storage = new FlutterSecureStorage();

  Future<dynamic> read(dynamic key) async {
    return storage.read(key: key);
  }

  Future<bool> writeToStorage(dynamic key, dynamic value) async {
    await storage.write(key: key, value: value);
    return true;
  }
}
