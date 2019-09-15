import 'package:flutter/material.dart';
import './pages/intro/splash.dart';
import 'package:flutter/services.dart';
import './pages/intro/views.dart';
import './pages/intro/intro.dart';
import 'pages/profile_art.dart';
import 'pages/profile_basic.dart';
import './pages/login.dart';
import 'pages/search.dart';
import 'pages/home.dart';
import 'dart:ui';
import './pages/pwd_reset.dart';
import 'pages/edit_profile_basic.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  return runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Montserrat'),
    title: "Moukef",
    home:SplashScreen(),
    routes: <String, WidgetBuilder>{
      //app routes
      '/splash': (BuildContext context) => new SplashScreen(),
      '/views': (BuildContext context) => new AppViews(),
    },
  ));
}
