import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  Future<String> googleSignIn() async {
    try {
      const androidClientId =
          '704407510729-h1uia4d8d6hj093b50tnc4s0vjsom5kf.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(clientId: androidClientId);
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      final idToken = googleAuth.idToken;
      final response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken!,
      );
      if (response.user == null) {
        throw Exception('Failed to sign in');
      }

      return 'google auth success';
    } on Exception catch (e) {
      log("$e");
    }
    throw Exception();
  }
}
