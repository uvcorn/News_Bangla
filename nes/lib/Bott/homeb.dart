import 'package:flutter/material.dart';
import 'package:nes/back/constant.dart';
import 'package:nes/back/webview.dart';

class Homb extends StatefulWidget {
  const Homb({Key? key}) : super(key: key);

  @override
  State<Homb> createState() => _HombState();
}

class _HombState extends State<Homb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: List.generate(national.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebviewPage(banglaNewspaperUrl[index])),
              );
            },
            child: Center(
              child: SelectCard(choice: national[index]),
            ),
          );
        }),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final ChoiceNational choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(choice.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
