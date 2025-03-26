import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/Splashpage/spalshpage.dart';
import 'package:supabase_crud/firebase_options.dart';
import 'package:supabase_crud/viewmodel/employeeprovider.dart';
import 'package:supabase_crud/viewmodel/image_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFnY2Z2dmx3eXloZGhicGVjc3ZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE1ODAzMzEsImV4cCI6MjA1NzE1NjMzMX0.qXnxBm6oc0ZThFX59IlCHEkcwROF24u4pEvrQZ44Xbc",
    url: "https://qgcfvvlwyyhdhbpecsvq.supabase.co",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Employeeprovider()),
        ChangeNotifierProvider(create: (context) => ImagePro()),
      ],
      child: MaterialApp(home: SplashPage(), debugShowCheckedModeBanner: false),
    );
  }
}
