import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/HomeScreen.dart';
import 'package:home_automation_using_voice_commands/SignIn_Screen.dart';
class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
      Timer(const Duration(seconds:5),()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()))
      );
    }else
    {
      Timer(const Duration(seconds:5),()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()))
      );
    }
  }
}