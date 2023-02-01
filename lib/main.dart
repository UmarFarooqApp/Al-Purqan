import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:holly_quran/pageview.dart';
import 'package:quran/quran.dart' as quran;
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  QuranApp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran Demo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Juz Number: \n${quran.getJuzNumber(18, 1)}"),
              Text("\nJuz URL: \n${quran.getJuzURL(15)}"),
              Text(
                  "\nSurah and Verses in Juz 15: \n${quran.getSurahAndVersesFromJuz(15)}"),
              Text("\nSurah Name: \n${quran.getSurahName(18)}"),
              Text(
                  "\nSurah Name (English): \n${quran.getSurahNameEnglish(18)}"),
              Text("\nSurah URL: \n${quran.getSurahURL(18)}"),
              Text("\nTotal Verses: \n${quran.getVerseCount(18)}"),
              Text(
                  "\nPlace of Revelation: \n${quran.getPlaceOfRevelation(18)}"),
              const Text("\nBasmala: \n${quran.basmala}"),
              InkWell(
                  onTap: (){
                    _launchURL();
                  },
                  child: Text("\nVerse 1: \n${quran.getJuzNumber(18,23)}")),
            ],
          ),
        ),
      ),
    );
  }
  void _launchURL() async {
    String url=quran.getJuzNumber(15,89) as String;
    var response=await Uri.parse(url);
    print('the respos is ${response}');
   // if (await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
