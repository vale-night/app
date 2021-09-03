import 'package:localstorage/localstorage.dart';

class LocalStorageService {
  final LocalStorage storage = new LocalStorage('valenight.json');

  void write(dynamic key, dynamic value) {
    storage.setItem(key, value);
  }

  dynamic read(key) {
    return storage.getItem(key);
  }
}
