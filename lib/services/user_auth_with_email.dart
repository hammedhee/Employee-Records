import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserAuthWithEmail {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final supabase = Supabase.instance.client;

  Future<String?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(
        password: password,
        email: email,
      );
    } catch (e) {}
  }

  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null) {
        storage.write(
          key: 'user',
          value: jsonEncode(response.session!.toJson()),
        );
      }
      return 'success';
    } catch (e) {
      throw Exception('erorr on auth services == $e');
    }
  }
}
