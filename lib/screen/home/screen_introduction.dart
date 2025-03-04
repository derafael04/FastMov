import 'package:fastmov/screen/login/tela_login_inicial.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class ScreenIntroduction extends StatefulWidget {
  const ScreenIntroduction({super.key});

  @override
  State<ScreenIntroduction> createState() => _ScreenIntroductionState();
}

class _ScreenIntroductionState extends State<ScreenIntroduction> {

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const TelaLoginInicial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Theme.of(context).primaryColor,
      allowImplicitScrolling: false,
      autoScrollDuration: 9999999,
      infiniteAutoScroll: false,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
            child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: Text(
              'Skip',
              style: TextStyle(
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
              color: Colors.white
              ),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: Text("Fractional shares", style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 28.0, color: Colors.white), textAlign: TextAlign.center),
          bodyWidget: const Text("Instead of having to buy an entire share, invest any amount you want.", style: TextStyle(fontFamily: 'Outfit', fontSize: 18.0, color: Color(0xffA8A8A9), fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
          image: Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Image.asset('assets/images/logo/logo.png', width: 180),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text("Fractional shares", style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 28.0, color: Colors.white), textAlign: TextAlign.center),
          bodyWidget: const Text("Instead of having to buy an entire share, invest any amount you want.", style: TextStyle(fontFamily: 'Outfit', fontSize: 18.0, color: Color(0xffA8A8A9), fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
          image: Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Image.asset('assets/images/logo/logo.png', width: 180),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text("Fractional shares", style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 28.0, color: Colors.white), textAlign: TextAlign.center),
          bodyWidget: const Text("Instead of having to buy an entire share, invest any amount you want.", style: TextStyle(fontFamily: 'Outfit', fontSize: 18.0, color: Color(0xffA8A8A9), fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
          image: Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Image.asset('assets/images/logo/logo.png', width: 180),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Outfit', color: Colors.white)),
      next: const Text('Próximo', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Outfit', color: Colors.white)),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Outfit', color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFD2D2D2),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.white,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}