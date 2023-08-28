import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musicapi_flutter/model/music_model.dart';
import 'package:musicapi_flutter/response/music_response.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<MusicModel> listDataMusic = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    getMusicAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: listDataMusic.length,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listDataMusic[index].title ?? "Phu Quy"),
          );
        }, // full data
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> getMusicAPI() async {
    try {
      final client = http.Client();
      final response = await client
          .get(Uri.https("storage.googleapis.com", "/uamp/catalog.json"));
      Map<String, dynamic> musicMap = jsonDecode(response.body);
      final dataList = MusicResponse.fromJson(musicMap);
      dataList.listData?.forEach((element) {
        listDataMusic.add(element);
      });
    } catch (e) {
      print(e);
    }
  }
}
