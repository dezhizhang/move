# move中项目
### 缓存
```
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
```



