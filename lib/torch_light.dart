import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchLight extends StatefulWidget {
  const TorchLight({Key? key}) : super(key: key);

  @override
  State<TorchLight> createState() => _TorchLightState();
}

class _TorchLightState extends State<TorchLight> {
  bool isActivated = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isActivated
                      ? "assets/images/bulb_on.png"
                      : "assets/images/bulb_off.png",
                  width: 300,
                  height: 500,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CircleAvatar(
                  minRadius: 30,
                  maxRadius: 45,
                  child: Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                      onPressed: () {
                        controller.toggle();
                        isActivated = !isActivated;
                        setState(() {
                          isActivated;
                        });
                      },
                      icon: Icon(
                        Icons.power_settings_new,
                        color: isActivated ? Colors.redAccent : Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ],
    );
  }
}