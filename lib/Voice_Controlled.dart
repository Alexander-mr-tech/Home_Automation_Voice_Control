import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:firebase_database/firebase_database.dart';

class VoiceControl extends StatefulWidget {
  const VoiceControl({Key? key}) : super(key: key);

  @override
  State<VoiceControl> createState() => _VoiceControlState();
}

class _VoiceControlState extends State<VoiceControl> {
  SpeechToText speechToText = SpeechToText();
  String text = "";
  var isListening = false;
  bool Fan = false;
  bool Light = false;
  bool Pump = false;
  bool Motion_Sensor = false;

  final dbRef = FirebaseDatabase.instance.ref();

  Future onUpdate_1() async {
    setState(() {
      Fan = !Fan;
    });
  }

  Future onWrite_1() async {
    dbRef.child("Appliances").set({"Fan": !Fan});
  }

  Future onUpdate_2() async {
    setState(() {
      Light = !Light;
    });
  }

  Future<void> onWrite_2() async {
    dbRef.child("Appliances").set({"Light": !Light});
  }

  Future onUpdate_3() async {
    setState(() {
      Pump = !Pump;
    });
  }

  Future<void> onWrite_3() async {
    dbRef.child("Appliances").set({"Pump": !Pump});
  }

  Future onUpdate_4() async{
    setState(() {
      Motion_Sensor = !Motion_Sensor;
    });
  }
  Future<void> onWrite_4() async {
    dbRef.child("Appliances").set({"Motion_Sensor": !Motion_Sensor});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        glowColor: Colors.white,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                      if (text == 'turn on fan') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_1();
                          onWrite_1();
                        }
                      }
                      if (text == 'turn off fan') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_1();
                          onWrite_1();
                        }
                        isListening = false;
                      }
                      if (text == 'turn on light') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_2();
                          onWrite_2();
                        }
                      }
                      if (text == 'turn off light') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_2();
                          onWrite_2();
                        }
                      }
                      if (text == 'turn on pump') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_3();
                          onWrite_3();
                        }
                      }
                      if (text == 'turn off pump') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_3();
                          onWrite_3();
                        }
                      }
                      if (text == 'turn on security') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_3();
                          onWrite_3();
                        }
                      }
                      if (text == 'turn off security') {
                        if (kDebugMode) {
                          print(text);
                          onUpdate_4();
                          onWrite_4();
                        }
                      }
                    });
                  });
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.cyan,
            radius: 45,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: const EdgeInsets.only(bottom: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: isListening ? Colors.redAccent : Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                "Controlling Your Devices with Your Voice",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: isListening ? Colors.purple : Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
