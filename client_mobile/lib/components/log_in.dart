import 'package:client_mobile/models/user.dart';
import 'package:client_mobile/screens/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String get route => '/loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType, bool visible) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          obscureText: visible,
          controller: userInput,
          decoration: InputDecoration(
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.green.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              'assets/images/group.png',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 510,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 45),
                    userInput(emailController, 'Email',
                        TextInputType.emailAddress, false),
                    userInput(passwordController, 'Password',
                        TextInputType.visiblePassword, true),
                    Container(
                      height: 55,
                      padding:
                          const EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: ElevatedButton(
                          child: const Text('Log In'),
                          style: style,
                          onPressed: () {
                            Future<List> data = User.getData(
                                emailController.text, passwordController.text);
                            data.then((data) {
                              if (data[0]["message"] == null) {
                                Navigator.pushNamed(context, Home.route);
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text('Erreur'),
                                          content: Text(
                                              data[0]["message"].toString()),
                                        ));
                              }
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
