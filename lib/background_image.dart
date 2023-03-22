import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/images.dart';
Widget bgWidget({Widget? child}){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(imgbackground),fit: BoxFit.fill),
    ),
    child: child,
  );
}