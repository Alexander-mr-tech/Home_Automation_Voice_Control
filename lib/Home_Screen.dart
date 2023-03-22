import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/background_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;

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
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Home Screen",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
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
      ),
    );
  }
}
