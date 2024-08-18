import 'package:dr_go/auth/auth_service.dart';
import 'package:flutter/material.dart';

class logInScreen extends StatefulWidget {
  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  final passwordController = TextEditingController();
  final auth = AuthService();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "WELCOME BACK!!  😁🪥 ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password??",
                  style: TextStyle(color: Colors.deepPurple),
                )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: signIn,
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account yet ?!"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.deepPurple),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  signIn() async {
    final loginUser =
        await auth.loginUser(emailController.text, passwordController.text);
    if (loginUser != null) {
      print("Login Successfully");
      // then navigate to the home page
    }
  }
}
