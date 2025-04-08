import 'package:fluttbase/auth/auth.dart';
import 'package:fluttbase/services/provider/database_provider.dart';
import 'package:fluttbase/services/provider/screenIndexProvider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'sadqah-app',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DatabaseProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => screenIndexProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sadqah App',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Poppins'),
      home: AuthPage(),
      routes: {
        // '/home': (context) => const HomeScreen(),
        '/login': (context) => const AuthPage(),
      },
    );
  }
}
