import 'package:flutter/material.dart';
import 'package:check_list_app/components/my_button.dart';
import 'package:check_list_app/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

// void signUserIn(){

// }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {} catch (e) {
      setState(() {
        // errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {} catch (e) {
      setState(() {
        // errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text("Check List");
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    bool obscureText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: title,
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
        errorMessage == "" ? "" : "Something went wrong! ${errorMessage}");
  }

  // Widget _submitButton() {
  //   return ElevatedButton(
  //     onPressed:
  //         isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
  //     child: Text(isLogin ? "Login" : "Register"),
  //   );
  // }

  Widget signUserIn() {
    return GestureDetector(
      onTap:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin
          ? "No account? Register here."
          : "Have an account? Login here."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Login or Register to start using Check List",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              _entryField("Email", _controllerEmail, false),
              const SizedBox(
                height: 25,
              ),
              _entryField("Password", _controllerPassword, true),
              const SizedBox(
                height: 5,
              ),
              // Text(
              //   'Forgot Password?',
              //   style: TextStyle(
              //     color: Colors.blueGrey[400],
              //   ),
              // ),
              _errorMessage(),
              // _submitButton(),
              myButton(
                onTap: isLogin
                    ? signInWithEmailAndPassword
                    : createUserWithEmailAndPassword,
                text: isLogin ? 'Sign In' : 'Sign Up',
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.blueGrey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.blueGrey[400],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  squareTile(imagePath: 'assets/apple.png'),
                  const SizedBox(
                    width: 30,
                  ),
                  squareTile(imagePath: 'assets/google.png'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
