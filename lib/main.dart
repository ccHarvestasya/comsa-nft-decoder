import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:symbol_ddk/infra/statistics_service_http.dart';
import 'package:symbol_ddk/util/comsa_nft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final TextEditingController _tf1 = TextEditingController();
  late Uint8List _nftData;
  Future<void>? _nftFuture;

  @override
  void initState() {
    super.initState();

    StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
    ssHttp.init();
  }

  void _getNft() {
    setState(() {
      _nftFuture = Future(() async {
        ComsaNft comsaNft = ComsaNft();
        _nftData = await comsaNft.decoder(mosaicId: _tf1.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _tf1,
            ),
            ElevatedButton(
              onPressed: _getNft,
              child: const Text('GO'),
            ),
            FutureBuilder(
              future: _nftFuture,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: SizedBox(
                        height: 600,
                        width: 600,
                      ),
                    );
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return Center(
                      child: SizedBox(
                        height: 600,
                        width: 600,
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: Theme.of(context).colorScheme.primary,
                          size: 100,
                        ),
                      ),
                    );
                  case ConnectionState.done:
                    return SingleChildScrollView(
                      child: Center(
                        child: Image.memory(
                          _nftData,
                          width: 600,
                          height: 600,
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
