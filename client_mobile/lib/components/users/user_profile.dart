import 'package:client_mobile/models/user.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final User? user = User(
      id: 1,
      username: 'test',
      email: 'test.téstetr@gmail.com',
      description: 'Miam le kebab',
      password: "test");
  //final Function callbackResetEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Column contents horizontally,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 300,
            child: Column(
              children: [
                Text("Username",
                    style: DefaultTextStyle.of(context).style.apply(
                        fontSizeFactor: 2.0,
                        decoration: TextDecoration.underline)),
                Text(user?.username ?? '',
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 2.0)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 300,
            child: Column(
              children: [
                Text("Email",
                    style: DefaultTextStyle.of(context).style.apply(
                        fontSizeFactor: 2.0,
                        decoration: TextDecoration.underline)),
                Text(user?.email ?? '',
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 2.0)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 300,
            child: Column(
              children: [
                Text("Description",
                    style: DefaultTextStyle.of(context).style.apply(
                        fontSizeFactor: 2.0,
                        decoration: TextDecoration.underline)),
                Text(user?.description ?? '',
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 2.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
