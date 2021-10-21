import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparks_task/fb_login_page.dart';
import 'package:sparks_task/google_login_controller.dart';
import 'package:sparks_task/login_page.dart';

import 'facebook_login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginPage(),
          ),
          ChangeNotifierProvider(
            create: (context) => FacebookSignInController(),
            child: LoginPage(),
          ),
          //
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FacebookLoginPage(),
        ));
  }
}
