import 'package:client_mobile/models/user.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final User? user =
      User(id: 1, username: 'test', email: 'test.téstetr@gmail.com');
  //final Function callbackResetEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            child: Title(
              color: const Color.fromARGB(255, 206, 14, 0),
              child: const Text("jdjdjd : "),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
