import 'package:client_mobile/components/log_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList('user') ?? [];
    //print(data);
    return data;
  }

  removeData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access-token');
      await prefs.remove('refresh-token');
      await prefs.remove('user');
      return 'Vous allez êtes déconnecter !';
    } catch (e) {
      return 'Problème lors de la suppression !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(children: <Widget>[
                      _headerUser(snapshot.data[1]),
                      _infoUser(snapshot.data)
                    ])),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    child: const Text("Se deconnecter"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      removeData().then((result) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text('Message'),
                                  content: Text(result),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, LoginPage.route);
                                      },
                                    ),
                                  ],
                                ));
                      });
                    },
                  ),
                )
              ]);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  _headerUser(username) => Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(0),
            height: 80,
            child: const Icon(Icons.supervised_user_circle, size: 90)),
        const SizedBox(height: 12.0),
        username != null
            ? Text(username,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: Colors.orange))
            : const Text(''),
      ]);

  _infoUser(userData) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 40.0),
          _email(userData[2]),
          const SizedBox(height: 12.0),
          _desc(userData[3]),
          // _mobile(),
          // const SizedBox(height: 12.0),
          // _birthDate(),
          // const SizedBox(height: 12.0),
          // _gender(),
          // const SizedBox(height: 12.0),
        ],
      ),
    );
  }

  _email(email) {
    return Row(children: <Widget>[
      _prefixIcon(Icons.email),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: Colors.grey)),
          const SizedBox(height: 1),
          email != null ? Text(email) : const Text(''),
        ],
      )
    ]);
  }

  _desc(desc) {
    return Row(children: <Widget>[
      _prefixIcon(Icons.description),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                    color: Colors.grey)),
            const SizedBox(height: 1),
            desc != null ? Text(desc) : const Text(''),
          ],
        ),
      )
    ]);
  }

  // _mobile() {
  //   return Row(children: <Widget>[
  //     _prefixIcon(Icons.phone),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: const [
  //         Text('Mobile',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w700,
  //                 fontSize: 15.0,
  //                 color: Colors.grey)),
  //         SizedBox(height: 1),
  //         Text('+91 0000000000')
  //       ],
  //     )
  //   ]);
  // }

  // _birthDate() {
  //   return Row(children: <Widget>[
  //     _prefixIcon(Icons.date_range),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: const [
  //         Text('Birth date',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w700,
  //                 fontSize: 15.0,
  //                 color: Colors.grey)),
  //         SizedBox(height: 1),
  //         Text('00-00-0000')
  //       ],
  //     )
  //   ]);
  // }

  // _gender() {
  //   return Row(children: <Widget>[
  //     _prefixIcon(Icons.person),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: const [
  //         Text('Gender',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w700,
  //                 fontSize: 15.0,
  //                 color: Colors.grey)),
  //         SizedBox(height: 1),
  //         Text('Male')
  //       ],
  //     )
  //   ]);
  // }

  _prefixIcon(IconData iconData) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(10.0))),
          child: Icon(
            iconData,
            size: 20,
            color: const Color.fromARGB(255, 43, 82, 21),
          )),
    );
  }
}
