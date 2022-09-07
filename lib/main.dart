import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:movie_macaron/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var allValues = <Widget>[];

    FlutterConfig.variables.forEach((k, v) {
      allValues.add(Text('$k: $v'));
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Macaron',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
