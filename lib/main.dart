import 'package:app_android_001/apps001/homepage1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apps Collection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Main Menu"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage1()),
                  );
                },
                label: const Text(
                  "Aplikasi 001",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.apple,
                  color: Colors.white,
                ),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage1()),
                  );
                },
                label: const Text(
                  "Aplikasi 002",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.app_registration_outlined,
                  color: Colors.white,
                ),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage1()),
                  );
                },
                label: const Text(
                  "Aplikasi 001",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.app_shortcut,
                  color: Colors.white,
                ),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
