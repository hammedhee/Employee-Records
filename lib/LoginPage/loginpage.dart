import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_crud/SignUpPage/signupPage.dart';
import 'package:supabase_crud/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.recent_actors_rounded,
                    color: Colors.amberAccent,
                    size: 35,
                  ),
                  Gap(10),
                  Text(
                    'Employee ',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  ShaderMask(
                    shaderCallback:
                        (bounds) => LinearGradient(
                          colors: [Colors.amberAccent, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                    child: Text(
                      'Record.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(15),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'login with google',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthServices().googleSignIn();
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn1.vectorstock.com/i/1000x1000/48/30/google-symbol-logo-design-vector-46334830.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => SignupPage()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
