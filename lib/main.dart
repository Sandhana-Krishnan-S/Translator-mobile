import 'dart:ffi';

import 'package:clipboard/clipboard.dart';
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

  //text Fields
  final _clientMessage = TextEditingController();
  final _serverMessage = TextEditingController();

  @override
  void dispose() {
    _clientMessage.dispose();
    _serverMessage.dispose();
    super.dispose();
  }


  Map<String , String> list = LanguageList().languageCodes;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width * 0.20,
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.00 , left: 16.00 , top: 36.00 , bottom: 36.00),
              decoration:  BoxDecoration(
                color: const Color(0xFFFBC490) ,
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
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isDense: true,
                              iconSize: 0.00,
                              items: list.map((language, value) {
                                return MapEntry(language , DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(language),
                                ));
                              }).values.toList(),
                              value: _language1,
                              alignment: Alignment.center,
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
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      )
                  ),
                  Center(
                    child: SvgPicture.asset(
                        "assets/images/transfer.svg",
                      height: 24,
                    ),
                  ),

                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          //TODO : add image of the language

                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconSize: 0.00,
                              items: list.map((language, value) {
                                return MapEntry(language , DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(language),
                                ));
                              }).values.toList(),
                              value: _language2,
                              alignment: Alignment.center,
                              onChanged: (String? newLanguage) {
                                setState(() {
                                  _language2 = newLanguage;
                                  print(_language2);
                                });
                              },
                              style: const TextStyle(
                                fontFamily: "Poppins" ,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  const Padding(padding: EdgeInsets.only(right: 16.00)),
                ],
              ) ,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0, bottom: 16.0),
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFB4B4B4)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Stack(
                    children: [
                      TextField(
                          controller: _clientMessage,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: ElevatedButton(
                          //Todo : add function to access api
                          onPressed: () => {},
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color(0xFFFBC490)),
                          ),
                          child: const Text(
                            "Translator",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0, bottom: 16.0),
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF878787)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: TextField(
                          controller: _serverMessage,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/languageUni.svg"),
                            Padding(padding: EdgeInsets.only(left: 16)),
                            Text(
                              findKeyByValue(_language2.toString()),
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 22.00,
                                color: Color(0xFF084177),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 24))
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: ElevatedButton(
                          onPressed: () => {
                            FlutterClipboard.copy(_serverMessage.text).then((value) => {
                              //todo : add a way to show the copy worked by changing the copy button
                            })
                          },
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/copy.svg") ,
                              const Padding(padding: EdgeInsets.only(left: 12.00)),
                              const Text(
                                "Copy",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(right: 16.00)),
          ],
        ),
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

  String findKeyByValue(String value) {
    return list.entries
        .firstWhere((entry) => entry.value == value, orElse: () => const MapEntry('', ''))
        .key;
  }
}
