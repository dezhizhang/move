import 'package:app/cache/cache.dart';
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
          primarySwatch: Colors.blue,
        ),
        home: HomeContent());
  }
}

class HomeContent extends StatefulWidget {
  _HomeContent createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  String text = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Cache.preInit();
  }

  void handleSetString() {
    Cache.getInstance()!.setString('name', '张三');
  }

  void handleGetString() {
    String text = Cache.getInstance()!.getString('name');
    setState(() {
      text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('-----');
    print(text);
    print('-----');
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: Text('$text'),
            ),
            ElevatedButton(
              child: Text('设置'),
              onPressed: handleSetString,
            ),
            ElevatedButton(
              child: Text('获取'),
              onPressed: handleGetString,
            )
          ],
        ),
      ),
    );
  }
}
