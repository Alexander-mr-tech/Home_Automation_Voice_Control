import 'package:flutter/material.dart';
import 'package:home_automation_using_voice_commands/HomeScreen.dart';
import 'package:home_automation_using_voice_commands/SignUp_Screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Room_1.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                "Welcome\nBack",
                style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    Form(
                    key:_formKey,
                    child:Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.blueAccent,
                                    width: 2.0,
                                  )),
                              hintText: 'Enter Your Email Address',
                              prefixIcon: const Icon(Icons.email),
                              hintStyle: const TextStyle(
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: passwordController,
                        style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0,
                              )),
                          hintText: 'Enter Your Password',
                          hintStyle: const TextStyle(
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Password";
                          }
                          return null;
                        },
                    ),
                    const SizedBox(
                      height: 40,
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Signin',
                          style: TextStyle(
                              color: Colors.white,fontSize:40, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              _navigateToHomeScreen(context);
                            },
                            icon: const Icon(Icons.arrow_forward,size: 42,color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              _navigateToSignUp(context);
                            },
                            child: const Text(
                              'SignUp',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){

                              }
                            },
                            child: const Text(
                              'Forget Password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ))
                      ],
                    )
                      ],
                    )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
void _navigateToSignUp(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SignUp()));
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
}