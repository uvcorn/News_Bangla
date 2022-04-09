import 'package:flutter/material.dart';
import 'package:nes/Bott/local.dart';
import 'package:nes/Bott/other.dart';
import 'package:nes/Bott/tech.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('Assets/newspaper.png'),
                    fit: BoxFit.cover),
              ),
              child: null,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Local()),
                );
              },
              leading: Image.asset(
                'Assets/job.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Local Newspaper'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tech()),
                );
              },
              leading: Image.asset(
                'Assets/technology.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Tech News'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Others()));
              },
              leading: const Icon(Icons.newspaper_sharp),
              title: const Text('Popular Website'),
            ),
          ],
        ),
      ),
    );
  }
}
