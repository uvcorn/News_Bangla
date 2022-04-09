import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nes/Bott/jobs.dart';
import 'package:nes/Bott/Inter.dart';
import 'package:nes/Bott/homeb.dart';
import 'back/cdrawer.dart';

Future<void> main(List<String> args)
// async
async {
  WidgetsFlutterBinding.ensureInitialized();
  // // await MobileAds.initialize();
  // MobileAds.setTestDeviceIds();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    const Homb(),
    const Inter(),
    const Jobsnav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 10, 10),
          centerTitle: true,
          title: (currentIndex == 0
              ? const Text("National newspaper")
              : (currentIndex == 1
                  ? const Text('International newspaper')
                  : currentIndex == 2
                      ? const Text('Jobs Newspaper')
                      : const Text('English TV Channel'))),
        ),
        drawer: const CustomDrawer(),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: const Color.fromARGB(255, 0, 10, 10),
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            // _pageController!.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: const Text(
                'National',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: const Icon(Icons.home),
              // inactiveColor: Colors.grey,
              activeColor: Colors.white,
            ),
            BottomNavyBarItem(
                title: const Text(
                  'International',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const FaIcon(FontAwesomeIcons.globe),
                // inactiveColor: Colors.grey,
                activeColor: Colors.white),
            BottomNavyBarItem(
                title: const Text(
                  'Job News',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const ImageIcon(
                  AssetImage("Assets/job.png"),
                  color: Colors.white,
                ))
            // inactiveColor: Colors.grey,
            // activeColor: Colors.white)
          ],
        ),
        body: screens[currentIndex]);
  }
}
