import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';


abstract class AuthLocalDataSource {
  Future<String?> getToken();

  Future<void> saveToken(String? token,TypeUser typeUser);

  Future<void> saveId(String? id);

  Future<String?> getId();

  Future<void> deleteToken();

  Future<String?> getName();

  Future<void> saveName(String? username);

  Future<TypeUser?> getRole();

  Future<void> saveRole(String? email);

  Future<void> savePhoneNumber(String? phoneNumber);
  Future<String?> getPhoneNumber();
  Future<String?> isOk ();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthImpLocalDataSource implements AuthLocalDataSource {
  String tokenKey = "key";
  String userIdKey = "userId";
  String nameKey = 'username';
  String roleKey = 'role';
  String phoneNumberKey = 'phoneNumber';

  @override
  Future<String?> getToken() async {
    return await storage.read(key: tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await storage.deleteAll();
  }

  @override
  Future<void> saveToken(String? token, TypeUser type) async {
    if (token == null) {
      throw Exception("Attempting to save a null token");
    }
    await storage.write(key: tokenKey, value: token);
    await storage.write(key: roleKey, value: type.name);

  }

  @override
  Future<void> saveId(String? id) async {
    return await storage.write(key: userIdKey, value: id);
  }

  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));


  @override
  Future<TypeUser> getRole() async {
    final typeName = await storage.read(key: roleKey);
    return TypeUser.values
        .firstWhereOrNull((element) => element.name == typeName) ??
        TypeUser.none;
  }
  @override
  Future<void> saveRole(String? email) async {
    return await storage.write(key: roleKey, value: email);
  }

  @override
  Future<void> saveName(String? username) async {
    return await storage.write(key: nameKey, value: username);
  }

  @override
  Future<String?> getName() async {
    return await storage.read(key: nameKey);
  }

  @override
  Future<String?> getId() async {
    return await storage.read(key: userIdKey);
  }

  @override
  Future<String?> getPhoneNumber() async {
    return await storage.read(key: phoneNumberKey);
  }

  @override
  Future<void> savePhoneNumber(String? phoneNumber) async {
    return await storage.write(key: phoneNumberKey, value: phoneNumber);
  }

  @override
  Future<String?> isOk()async {
    return await storage.read(key: "isOk");
  }@override
  Future<void> isOkSave(bool isOk)async {
    return await storage.write(key: "isOk",value: isOk.toString());
  }
}
enum TypeUser { student, teacher, none }
