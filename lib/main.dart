import 'package:flutter/material.dart';
import 'package:hostingwebsite/providers/appProvider.dart';
import 'package:hostingwebsite/screens/payments.dart';
import 'package:hostingwebsite/screens/sharedhosting.dart';
import 'package:provider/provider.dart';

import 'package:hostingwebsite/screens/SharedHostingCartScreen.dart';
import 'package:hostingwebsite/screens/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hostingwebsite/screens/homescreen.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(


      MultiProvider(providers: [

      ChangeNotifierProvider.value(value: AppProvider.initialize())

      ],child: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:RazorPayWeb(price: 100,name: 'dsdsds',),
    );
  }
}
