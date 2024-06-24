import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translator/Model/appTheme.dart';
import 'package:translator/Model/constants.dart';
import 'package:translator/Model/imageUtils.dart';
import 'package:translator/Model/styles.dart';
import 'package:translator/View/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const HomePage(),
  //     ));
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageUtils.universalLanguage,
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 20),
            Text(
              Constants.translator,
              style: Styles.splashText(),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.doneBy,
                  style: Styles.blackText(16),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    Constants.author,
                    style: Styles.blackText(16),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
