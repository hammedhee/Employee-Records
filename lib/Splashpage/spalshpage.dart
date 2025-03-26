import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_crud/Homepage/homepage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Row(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback:
                      (bounds) => LinearGradient(
                        colors: [Colors.amberAccent, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                  child: Text(
                    'Loading..',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap(10),
                CircularProgressIndicator(
                  color: Colors.amberAccent,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getLoginData() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return Homepage();
          },
        ),
      );
    });
  }
}
