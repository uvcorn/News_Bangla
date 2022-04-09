import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nes/back/constant.dart';
import 'package:nes/back/webview.dart';

class Local extends StatefulWidget {
  const Local({Key? key}) : super(key: key);

  @override
  State<Local> createState() => _LocalState();
}

late BannerAd _bannerAd;
bool _isAdLoaded = false;

class _LocalState extends State<Local> {
  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-7252544612779369/2512083277",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            _isAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            log(error.toString());
            _isAdLoaded = false;
          },
          onAdClosed: (ad) {
            ad.dispose();
            _isAdLoaded = true;
          },
        ),
        request: const AdRequest());
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text("Local NewsPaper"),
      ),
      bottomNavigationBar: _isAdLoaded
          ? SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : const SizedBox(),
      body: Stack(
        children: [
          PageView(
            children: [
              GridView.count(
                padding: const EdgeInsets.all(8),
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                children: List.generate(locn.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebviewPage(loc[index])),
                      );
                    },
                    child: Center(
                      child: Localt(choiceloc: locn[index]),
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

class Localt extends StatelessWidget {
  const Localt({Key? key, required this.choiceloc}) : super(key: key);
  final Choiceloc choiceloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(
        child: Image.asset(choiceloc.title),
        height: 180,
        width: 180,
        color: Colors.white,
      ),
    );
  }
}
