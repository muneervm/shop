import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
 late FlutterSecureStorage _storage;
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
 void intialisesecuredstorage(){
    _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

 }

 
  Future<void> writeToken(String token) async {
    intialisesecuredstorage();
    await _storage.write(key: 'token', value: token,); 
    
  }

  Future<String?> readToken() async {
    intialisesecuredstorage();
    return await _storage.read(key: 'token');
  }
   Future<void> deleteToken() async {
    intialisesecuredstorage();
    return await _storage.delete(key: 'token');
  }
 
      
}

  



