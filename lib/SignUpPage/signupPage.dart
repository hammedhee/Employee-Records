// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_crud/Homepage/homepage.dart';
import 'package:supabase_crud/LoginPage/loginpage.dart';
import 'package:supabase_crud/services/user_auth_with_email.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordCondroller = TextEditingController();
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
                  hintText: "Enter your name",
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(15),

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
                  onPressed: () {
                    UserAuthWithEmail authWithEmail = UserAuthWithEmail();
                    authWithEmail.registerUser(
                      email: emailController.text,
                      password: passwordCondroller.text,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Text('sign up'),
                ),
              ),

              Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Login",
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
