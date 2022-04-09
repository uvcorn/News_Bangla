import 'package:flutter/material.dart';
import 'package:nes/back/constant.dart';
import 'package:nes/back/webview.dart';

class Jobsnav extends StatefulWidget {
  const Jobsnav({Key? key}) : super(key: key);

  @override
  State<Jobsnav> createState() => _JobsnavState();
}

class _JobsnavState extends State<Jobsnav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(jobs.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(jobslink[index])),
              );
            },
            child: Center(
              child: Jobsnews(jobs: jobs[index]),
            ),
          );
        }),
      ),
    );
  }
}

class Jobsnews extends StatelessWidget {
  const Jobsnews({Key? key, required this.jobs}) : super(key: key);
  final Jobsnewspaper jobs;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(jobs.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
