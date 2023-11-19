import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/my_button.dart';
import 'package:login_page/components/my_textfield.dart';
import 'package:login_page/components/square_tile.dart';
import 'package:login_page/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign user in method
  void signUserUp() async{
    //show loading circle
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try creating the user
    try {
      //confirm if password is the same
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
      } else {
        //show error message, passwords don't match
        showErrorMessage("Passwords don't match");
      }
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
                    height: 130,
                  ),



                  //Lets create an account for you
                  Text(
                    'Let\'s create an account for you!',
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

                  //confirm password textfield
                  MyTextfield(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //sign in button
                  MyButton(
                    text: "Sign Up",
                    onTap: signUserUp,
                  ),

                  const SizedBox(height: 20),


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

                  const SizedBox(height: 30),

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
                        onTap:() {},
                          imagePath:'lib/images/apple.png'
                      ),
                    ],
                  ), //row

                  const SizedBox(height: 40),

                  //not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width:4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login Now',
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