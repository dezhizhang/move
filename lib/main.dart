import 'package:app/core/hiNet.dart';
import 'package:app/http/request/testRequest.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeContent());
  }
}

class HomeContent extends StatefulWidget {
  _HomeContent createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ElevatedButton(
          child: Text('按钮'),
          onPressed: () async {
            TestRequest request = TestRequest();
            request.add('aa', 'ddd').add('bbb', '333');
            var result = await HiNet.getInstance()!.fire(request);
            print(result);
          },
        ),
      ),
    );
  }
}
