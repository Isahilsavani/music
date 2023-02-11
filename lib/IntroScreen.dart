import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class BrowserIntro extends StatefulWidget {
  const BrowserIntro({Key? key}) : super(key: key);

  @override
  State<BrowserIntro> createState() => _BrowserIntroState();
}

class _BrowserIntroState extends State<BrowserIntro> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int pageNumber = 0;

  void _onIntroEnd(context) async {
    Navigator.of(context).pushNamed('login');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('introEnd', true);
    });
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB( 16.0, 16.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Millions of songs",
          body: "",
          image: _buildImage('asset/image/disk.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Listen to your favorite podcasts",
          body: "",
          image: _buildImage('asset/image/music.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Start Listening",
          body: "",
          image: _buildImage('asset/image/mega.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => introKey.currentState!.skipToEnd(),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF6495ED),
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Color(0xFF6495ED),
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF6495ED),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFADD8E6),
        activeColor: Color(0xFF6495ED),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}