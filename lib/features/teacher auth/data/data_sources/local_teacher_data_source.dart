//
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:injectable/injectable.dart';
//
// abstract class AuthTeacherLocalDataSource {
//   Future<String?> getTeacherToken ();
//   Future<void> saveTeacherToken(String? token);
//
//   Future<void> saveTeacherId(String? id);
//   Future<String?> getTeacherId();
//
//   Future<void> deleteToken();
//
//
//   Future<String?> getTeacherName ();
//   Future<void> saveTeacherName(String? username);
//
//   Future<String?> getRole();
//   Future<void> saveRole(String? email);
//
//   Future<void> saveTeacherPhoneNumber(String? phoneNumber);
//   Future<String?> getTeacherPhoneNumber();
//
//
// }
// @LazySingleton(as:AuthTeacherLocalDataSource)
// class AuthImplTeacherLocalDataSource implements  AuthTeacherLocalDataSource{
//   String tokenKey = "key";
//   String userIdKey="userId";
//   String nameKey='username';
//   String roleKey='role';
//   String phoneNumberKey='phoneNumber';
//
//   @override
//   Future<String?> getTeacherToken() async{
//     return await storage.read(key:tokenKey);
//   }
//   @override
//   Future<void> deleteToken() async {
//     await storage.deleteAll();
//   }
//
//   @override
//   Future<void> saveTeacherToken(String? token) async {
//     if (token == null) {
//       throw Exception("Attempting to save a null token");
//     }
//     await storage.write(key: tokenKey, value: token);
//   }
//
//   @override
//   Future<void> saveTeacherId(String? id) async {
//     return await storage.write(key: userIdKey, value: id);
//   }
//
//
//   final storage = const FlutterSecureStorage(
//       aOptions: AndroidOptions(
//         encryptedSharedPreferences: true,
//       ));
//
//   @override
//   Future<String?> getRole() async{
//     return await storage.read(key:roleKey);
//   }
//
//
//
//   @override
//   Future<void> saveRole(String? email) async{
//     return await storage.write(key: roleKey, value: email);
//   }
//
//   @override
//   Future<void> saveTeacherName(String? username)async {
//     return await storage.write(key: nameKey, value: username);
//   }
//
//   @override
//   Future<String?> getTeacherName() async{
//     return await storage.read(key:nameKey);
//   }
//   @override
//   Future<String?> getTeacherId() async {
//     return await storage.read(key:userIdKey);
//   }
//
//   @override
//   Future<String?> getTeacherPhoneNumber()async {
//     return await storage.read(key:phoneNumberKey);
//   }
//
//   @override
//   Future<void> saveTeacherPhoneNumber(String? phoneNumber) async{
//     return await storage.write(key: phoneNumberKey, value: phoneNumber);
//
//   }
//
// }