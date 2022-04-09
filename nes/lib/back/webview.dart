import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

String papername = 'ff';

class WebviewPage extends StatefulWidget {
  String paper;

  WebviewPage(this.paper, {Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  late WebViewController controller;
  bool addfavorite = false;
  int checkclick = 1;
  bool isLoading = true;
  double progress = 0;
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
          onAdClosed: (ad) {
            ad.dispose();
            _isAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            log(error.toString());
            _isAdLoaded = false;
          },
        ),
        request: const AdRequest());
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          // stay app
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Read'),
          actions: [
            IconButton(
              onPressed: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
            IconButton(
              onPressed: () => controller.reload(),
              icon: const Icon(Icons.refresh_rounded),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            WebView(
              initialUrl: widget.paper,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onProgress: (progress) =>
                  setState(() => this.progress = progress / 100),
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                : Stack(),
          ],
        ),
        bottomNavigationBar: _isAdLoaded
            ? SizedBox(
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
              )
            : const SizedBox(),
      ),
    );
  }
}
