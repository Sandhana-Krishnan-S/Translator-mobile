import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translator/Controller/promote_handler.dart';
import 'package:translator/Model/appTheme.dart';
import 'package:translator/Model/constants.dart';
import 'package:translator/Model/imageUtils.dart';
import 'package:translator/Model/styles.dart';

import '../Controller/dropdown_helper.dart';
import '../Controller/translate_api_handler.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //DropDown value handles

  String? _language1 = Constants.clientLanguage;
  String? _language2 = Constants.serverLanguage;

  //text Fields

  final _clientMessage = TextEditingController();
  final _serverMessage = TextEditingController();

  @override
  void dispose() {
    _clientMessage.dispose();
    _serverMessage.dispose();
    super.dispose();
  }

  Map<String , String> languageList = Constants.languageCodes;


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
                  ImageUtils.logo,
                  height: 24,
                ),
              ),
              Center(
                child: Text(
                  Constants.translate,
                  style: Styles.whiteText(24),
                ),
              ),
              InkWell(
                onTap: () => PromoteHandler.coffeeTime(Constants.buyMeCoffee),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    ImageUtils.coffee,
                    height: 22,
                  ),
                ),
              ),
            ],
          )
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.00 , left: 16.00 , top: 36.00 , bottom: 36.00),
              decoration:  BoxDecoration(
                color: Apptheme.secondaryColor,
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
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isDense: true,
                              iconSize: 0.00,
                              items: languageList.map((language, value) {
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
                                  debugPrint(_language1);
                                });
                              },
                              style: Styles.blackText(14),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      )
                  ),
                  Center(
                    child: SvgPicture.asset(
                      ImageUtils.transferArrow,
                      height: 24,
                    ),
                  ),

                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                iconSize: 0.00,
                                items: languageList.map((language, value) {
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
                                  });
                                },
                                style: Styles.blackText(14)
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
                    border: Border.all(color: Apptheme.lightGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
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
                          onPressed: () async {
                            final translatedMessage = await TranslateApiHandler.translateMessage(
                              _clientMessage.text,
                              _language1.toString(),
                              _language2.toString(),
                            );
                            setState(() {
                              _serverMessage.text = translatedMessage;
                            });
                          },
                          style: Styles.primaryButton(),
                          child: Text(
                            Constants.translator,
                            textAlign: TextAlign.center,
                            style: Styles.blackText(12),
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
                  decoration: Styles.textBox(),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: TextField(
                          controller: _serverMessage,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Row(
                          children: [
                            SvgPicture.asset(ImageUtils.universalLanguage),
                            const Padding(padding: EdgeInsets.only(left: 16)),
                            Text(
                              DropdownHelper.findKeyByValue(_language2.toString(), languageList),
                              style: Styles.primaryText(),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 24))
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
                          style: Styles.customTextButton(),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageUtils.copyLogo) ,
                              const Padding(padding: EdgeInsets.only(left: 12.00)),
                              Text(
                                Constants.copy,
                                textAlign: TextAlign.center,
                                style: Styles.blackText(12),
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
}
