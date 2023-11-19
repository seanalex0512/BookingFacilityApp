import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/my_button.dart';
import 'package:login_page/components/my_textfield.dart';
import 'package:login_page/components/square_tile.dart';
import 'package:login_page/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
   const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
void signUserIn() async{
  //show loading circle
  showDialog(
    context: context,
    builder: (context){
    return const Center(
      child: CircularProgressIndicator(),
    );
  },
  );

  //trying to sign in
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
    );
    //pop the loading circle
    Navigator.pop(context);
  } on FirebaseAuthException catch (e){
    //pop the loading circle
    Navigator.pop(context);
    //show error message
    showErrorMessage(e.code);
  }
}

//error message to user
  void showErrorMessage(String message){
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const SizedBox(height: 50),


              //logo
                Image.asset(
                  'lib/images/intilogo.png',
                  width: 200,
                  height: 200,
                ),

              const SizedBox(height: 10),

              //welcome back
                Text(
                    'INTI Booking Facility App',
                style: TextStyle(
                    color: Colors.grey[700],
                  fontSize: 20,
                 ),
                ),

              const SizedBox(height: 25),

              //username textfield
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email' ,
                  obscureText: false,

                ),

              const SizedBox(height: 10),

              //password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

              const SizedBox(height: 10),

              //forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 25),

              //sign in button
                MyButton(
                  text: "Sign in",
                  onTap: signUserIn,
                ),

              const SizedBox(height: 30),


              //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child:Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                        )
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                              'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                            child:Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            )
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height:30),

                //google +apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    //google button
                   SquareTile(
                     onTap: () => AuthService().signInWithGoogle(),
                       imagePath:'lib/images/google.png'
                   ),

                     SizedBox(width:25),

                    //apple button
                    SquareTile(
                      onTap: () {

                      },
                        imagePath:'lib/images/apple.png'
                    ),

                  ],
                ), //row

                const SizedBox(height: 30),


                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                      'Not A Member?',
                          style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width:4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                        'Register Now',
                            style:TextStyle(
                              color: Colors.blue,fontWeight: FontWeight.bold),
                            ),
                  )
                 ],
                )
            ],
            ),
          ),
        ),
      )
    );
  }
}