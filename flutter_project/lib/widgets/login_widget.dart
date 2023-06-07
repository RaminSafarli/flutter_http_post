import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/service/login_service.dart';

import '../pages/Test.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginService loginService = LoginService();

  late String enteredEmail;
  late String enteredPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Email or Phone Number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "ramin.seferli.kb@gmail.com",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            hintText: "********",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: null,
              child: Text(
                "Forget Password?",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              setState(() {});
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                enteredEmail = emailController.text;
                enteredPassword = passwordController.text;
                debugPrint(enteredEmail + " " + enteredPassword);
                var data =
                    loginService.loginUser(enteredEmail, enteredPassword);
                data.then((value) => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Test(myToken: value))));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.white),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
