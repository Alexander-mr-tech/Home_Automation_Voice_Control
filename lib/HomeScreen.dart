import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:home_automation_using_voice_commands/SignIn_Screen.dart';
import 'package:home_automation_using_voice_commands/Voice_Controlled.dart';
import 'package:home_automation_using_voice_commands/background_image.dart';
import 'package:home_automation_using_voice_commands/home.dart';
import 'package:home_automation_using_voice_commands/torch_light.dart';
=======
import 'package:home_automation_using_voice_commands/Voice_Controlled.dart';
import 'package:home_automation_using_voice_commands/background_image.dart';
>>>>>>> origin/master

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
<<<<<<< HEAD

  int _currentIndex = 0;
  final tabs =[
    const Home(),
    const VoiceControl(),
    const TorchLight(),

  ];
=======
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
>>>>>>> origin/master

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
<<<<<<< HEAD
            "Home Automation Using Voice Command",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
=======
            "Home Screen",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
>>>>>>> origin/master
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
<<<<<<< HEAD
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
            ),
          ],
        ),
        body:tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 20,
          unselectedFontSize: 18,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home
                ),
              label : "Home",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic
              ),
              label : "Voice Control",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home
              ),
              label : "Torch",
              backgroundColor: Colors.blue,
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),

=======
                // Handle logout button press
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: Image.asset(
                    "assets/images/Room_1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 220,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("65 %",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                Icon(Icons.grain,color: Colors.cyanAccent,size: 35,),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text("Room\nHumidity",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                          const Divider(
                            height: 20,
                            color: Colors.white60,
                            thickness: 4,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              const Center(
                                  child: Text("Fan Control",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white))),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text("ON / OFF",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Switch(
                                      activeColor: Colors.red,
                                      value: button1,
                                      onChanged: (value) {
                                        setState(() {
                                          button1 = value;
                                        });
                                      })
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 220,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('35\u00B0C',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                Icon(Icons.thermostat,color: Colors.red,size: 35,),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text("Room\nTemperature",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                          const Divider(
                            height: 20,
                            color: Colors.white60,
                            thickness: 4,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              const Center(
                                  child: Text("Light Control",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white))),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text("ON / OFF",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Switch(
                                      activeColor: Colors.red,
                                      value: button2,
                                      onChanged: (value) {
                                        setState(() {
                                          button2 = value;
                                        });
                                      })
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 190,
                      width: 400,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Water Level")
                        ],
                      )
                  )
                ],
              ),
            ],
          ),
        ),
>>>>>>> origin/master
      ),
    );
  }
}
