import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/Splash_Severices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState(){
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
        Colors.blue,
        Colors.purple,
        ],
    ),
    ),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/smart-house.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text("Home Automation\nUsing\nVoice Commands",textAlign:TextAlign.center,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}
