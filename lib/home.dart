import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool Fan = false;
  bool  Light= false;
  bool Pump = false;
  bool Motion_Sensor = false;

  final dbRef = FirebaseDatabase.instance.ref();


  Future onUpdate_1() async{
    setState(() {
      Fan = !Fan;
    });
  }

  Future onUpdate_2() async{
    setState(() {
      Light = !Light;
    });
  }

  Future onUpdate_3() async{
    setState(() {
      Pump = !Pump;
    });
  }

  Future onUpdate_4() async{
    setState(() {
      Motion_Sensor = !Motion_Sensor;
    });
  }

  Future<void> onWrite_1() async {
    dbRef.child("Appliances").set({"Fan": !Fan});
  }

  Future<void> onWrite_2() async {
    dbRef.child("Appliances").set({"Light": !Light});
  }

  Future<void> onWrite_3() async {
    dbRef.child("Appliances").set({"Pump": !Pump});
  }
  Future<void> onWrite_4() async {
    dbRef.child("Appliances").set({"Motion_Sensor": !Motion_Sensor});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.blue,
              child: Image.asset(
                "assets/images/Room_1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width*0.40,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
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
                            Icon(
                              Icons.grain,
                              color: Colors.cyanAccent,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Room\nHumidity",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("ON / OFF",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Switch(
                                  activeColor: Colors.red,
                                  value: Fan,
                                  onChanged: (value) {
                                    setState(() {
                                      onUpdate_1();
                                      onWrite_1();
                                    });
                                  })
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width*0.40,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
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
                            Icon(
                              Icons.thermostat,
                              color: Colors.red,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Room\nTemperature",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("ON / OFF",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Switch(
                                  activeColor: Colors.red,
                                  value: Light,
                                  onChanged: (value) {
                                    setState(() {
                                      onUpdate_2();
                                      onWrite_2();
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
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width*0.40,
                  height: MediaQuery.of(context).size.height * 0.32,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              color: Colors.cyanAccent,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Water Level",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white)),
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
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Water Pump Control",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("ON / OFF",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Switch(
                                  activeColor: Colors.red,
                                  value: Pump,
                                  onChanged: (value) {
                                    setState(() {
                                      onUpdate_3();
                                      onWrite_3();
                                    });
                                  })
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width*0.40,
                  height: MediaQuery.of(context).size.height * 0.32,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.security,
                              color: Colors.cyanAccent,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: Text("Security",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white)),
                        ),
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
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Motion\nSensor",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("ON / OFF",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Switch(
                                  activeColor: Colors.red,
                                  value: Motion_Sensor,
                                  onChanged: (value) {
                                    setState(() {
                                      onUpdate_4();
                                      onWrite_4();
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

    ]
    )
    );
  }
}


