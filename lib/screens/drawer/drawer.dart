import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/dashboard/dasboard.dart';
import 'package:flutter_boilerplate/screens/login/login.dart';
import 'package:flutter_boilerplate/shared_preferences/shared_preferences.dart';
import 'package:flutter_boilerplate/users_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(children: [
      DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
            Text(
              "E-Paw",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('ANASAYFA'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('MÜŞTERİLER'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UsersPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.calendar_month_outlined),
        title: const Text('RANDEVU TAKVİMİ'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const PetsPage()));
        },
      ),
      ListTile(
        leading: const Icon(Icons.sms),
        title: const Text('TOPLU SMS'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.add_alert_rounded),
        title: const Text('AJANDAM'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Çıkış yap'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          _showExitDialog(context);
        },
      ),
    ])));
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Çıkış Yap'),
        content: const Text('Çıkış yapmak istediğinizden emin misiniz?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dialog kutusunu kapat
            },
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              SPService().deleteToken();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            },
            child: const Text('Çıkış Yap'),
          ),
        ],
      ),
    );
  }
}
