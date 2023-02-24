import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/drawer.widget.dart';
import '../config/global.params.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Page Home')),
        body: Center(
          child: Wrap(
            children: [
              ...(GlobalParams.accueil as List).map((item) {
                return InkWell(
                    child: Ink.image(
                      padding: EdgeInsets.all(30),
                      height: 120,
                      width: 120,
                      image: NetworkImage(item['image']),
                    ),
                    onTap: () {
                      if ('${item['image']}' !=
                          NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/2767/2767155.png',
                          ))
                        Navigator.pushNamed(context, "${item['route']}");
                      else
                        _Deconnexion(context);
                    });
              })
            ],
          ),
        ));
  }

  Future<void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Colors.white, Colors.blue])),
//             child: Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage("images/profil.png"),
//                 radius: 80,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
