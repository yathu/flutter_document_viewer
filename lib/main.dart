import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String baseUrl = 'https://docs.google.com/viewer?url=';
  String fileUrl = 'https://file-examples.com/storage/feb2e515cc6339d7ba1ffcd/2017/02/file-sample_100kB.doc';

  //preview by office
  String officeUrl = 'https://view.officeapps.live.com/op/embed.aspx?src=https://file-examples.com/storage/feb2e515cc6339d7ba1ffcd/2017/02/file-sample_100kB.doc';

  Widget build(BuildContext context) {
    String previewUrl = baseUrl+fileUrl;

    print(previewUrl);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:   Center(
        child: WebView(
          // initialUrl: previewUrl,
          initialUrl: officeUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
