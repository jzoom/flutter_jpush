import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_jpush/flutter_jpush.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;
  String _registrationId;
  FlutterJpush _jpush ;

  List<JPushNotification> _notificationList = [];

  @override
  void initState() {
    super.initState();
    _jpush=  new FlutterJpush();
    _startupJpush();

    FlutterJpush.addConnectionChangeListener( (bool connected){
      setState(() {
        /// 是否连接，连接了才可以推送
        _isConnected = connected;
      });
    });

    FlutterJpush.addnetworkDidLoginListener( (String registrationId){
      setState(() {
        /// 用于推送
        _registrationId = registrationId;
      });
    });

    FlutterJpush.addReceiveNotificationListener( (JPushNotification notification){
      _notificationList.add(notification);
    });
  }



  void _startupJpush() async{
    print("初始化jpush");
    await FlutterJpush.startup();
    print("初始化jpush成功");

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text("Connection State: "),
                new Text(_isConnected ? "连接" : "未连接" )
              ],
            ),

            new Row(
              children: <Widget>[
                new Text("RegistrationId: "),
                new Text( _registrationId ?? "" )
              ],
            ),

            new Padding(padding: new EdgeInsets.all(10.0),
            child: new Text("Push history:"),),

            new Expanded(child: new ListView.builder(itemBuilder: (context,int index){
              JPushNotification notification = _notificationList[index];
              return new Padding(padding: new EdgeInsets.all(10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  
                  new Row(
                    children: <Widget>[
                      new Text("内容:"),
                      new Text(notification.content)
                    ],
                  )

                ],
              ),);

            },itemCount: _notificationList.length,))

          ],
        ),
      ),
    );
  }
}
