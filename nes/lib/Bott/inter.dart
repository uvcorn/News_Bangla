import 'package:flutter/material.dart';
import 'package:nes/back/constant.dart';
import 'package:nes/back/webview.dart';

class Inter extends StatefulWidget {
  const Inter({Key? key}) : super(key: key);

  @override
  State<Inter> createState() => _InterState();
}

class _InterState extends State<Inter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              GridView.count(
                padding: const EdgeInsets.all(8),
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                children: List.generate(choiceInternational.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebviewPage(internationalNewspaperUrl[index])),
                      );
                    },
                    child: Center(
                      child: International(
                          choiceInternational: choiceInternational[index]),
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class International extends StatelessWidget {
  const International({Key? key, required this.choiceInternational})
      : super(key: key);
  final ChoiceInternational choiceInternational;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(choiceInternational.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
