import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/background_image.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceControl extends StatefulWidget {
  const VoiceControl({Key? key}) : super(key: key);

  @override
  State<VoiceControl> createState() => _VoiceControlState();
}

class _VoiceControlState extends State<VoiceControl> {

  SpeechToText speechToText = SpeechToText();
  var text = "Press Button Speech To Text";

  var isListening = false;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
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
              if(!isListening){
                var available = await speechToText.initialize();
                if(available){
                  setState(() {
                    isListening = true;
                    speechToText.listen(
                      onResult: (result){
                        setState(() {
                          text = result.recognizedWords;
                        });
                      }
                    );
                  });
                }
              }
            },
            onTapUp: (details){
              setState(() {
                isListening = false;
              });
              speechToText.stop();
            },
            child: CircleAvatar(
              backgroundColor: Colors.cyan,
              radius: 35,
              child: Icon(isListening ? Icons.mic : Icons.mic_none,color: Colors.white,),
            ),
          ),
        ) ,

        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Voice Controller"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Handle logout button press
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            margin: const EdgeInsets.only(bottom: 150),
            child: Text(text,style: TextStyle(fontSize: 30,
            color: isListening ? Colors.black87 : Colors.black54 ,fontWeight: FontWeight.w600),),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mic,
                size: 25,
              ),
              label: 'Voice Controlled',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              label: 'Profile',
            ),
          ],
        ),
      )
    );
  }
}
