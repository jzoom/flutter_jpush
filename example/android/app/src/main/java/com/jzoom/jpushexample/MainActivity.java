package com.jzoom.jpushexample;

import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;

import com.jzoom.jpush.JpushPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    Log.i("MaiActivity","Naun start");

    System.err.print("Main Acitvity Start");

    Log.e("Main","jkfjdklsfjklsdjfldsfsdf");


    //registerReceiver(new JpushPlugin.MyJPushMessageReceiver(),new IntentFilter());

    GeneratedPluginRegistrant.registerWith(this);
  }
}
