import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/SignIn_Screen.dart';
import 'package:torch_controller/torch_controller.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  TorchController().initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:
      SignInScreen(),
    );
  }
}
