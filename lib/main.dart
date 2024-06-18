import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transilator/language_list.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: const Color(0xFF084177),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //DropDown value handles

  String? _language1 = "auto";
  String? _language2 = "en";

  Map<String , String> list = LanguageList().languageCodes;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child:  SvgPicture.asset(
               "assets/images/translate-variant.svg",
               height: 24,
             ),
           ),
            const Center(
              child: Text(
                  "Translate" ,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            InkWell(
              onTap: () => _coffeeTime('https://buymeacoffee.com/sandusans'),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  'assets/images/coffee.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.00 , left: 16.00 , top: 36.00 , bottom: 36.00),
            decoration:  BoxDecoration(
              color: Color(0xFFFBC490) ,
              borderRadius: BorderRadius.circular(12.00),
            ),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left: 16.00)),
                Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        //TODO : add image of the language

                        DropdownButton<String>(
                          iconSize: 0.00,
                          items: list.map((language, value) {
                            return MapEntry(language , DropdownMenuItem<String>(
                              value: value,
                              child: Text(language),
                            ));
                          }).values.toList(),
                          value: _language1,
                          onChanged: (String? newLanguage) {
                            setState(() {
                              _language1 = newLanguage;
                              print(_language1);
                            });
                          },
                          style: const TextStyle(
                            fontFamily: "Poppins" ,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                ),
                const Padding(padding: EdgeInsets.only(left: 16.00)),
                //TODO : add the transfer image
                const Padding(padding: EdgeInsets.only(left: 16.00)),
                Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        //TODO : add image of the language

                        DropdownButton<String>(
                          iconSize: 0.00,
                          items: list.map((language, value) {
                            return MapEntry(language , DropdownMenuItem<String>(
                              value: value,
                              child: Text(language),
                            ));
                          }).values.toList(),
                          value: _language1,
                          onChanged: (String? newLanguage) {
                            setState(() {
                              _language1 = newLanguage;
                              print(_language1);
                            });
                          },
                          style: const TextStyle(
                            fontFamily: "Poppins" ,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                ),
                const Padding(padding: EdgeInsets.only(right: 16.00)),
              ],
            ) ,
          )
        ],
      ),
    );
  }

  Future<void> _coffeeTime(String url) async {
    try {
      final uri = Uri.parse(url);
        await launchUrl(uri);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

}
