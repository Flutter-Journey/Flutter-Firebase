import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    runApp(MyApp(errorMessage: 'Failed to connect to Firebase: $e'));
  }
}

class MyApp extends StatelessWidget {
  final String? errorMessage;

  const MyApp({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(errorMessage: errorMessage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? errorMessage;

  const MyHomePage({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    // Additional project information to display
    String projectInfo = '''
    Flutter Firebase Demo

    Firebase Connection Status: ${Firebase.apps.isNotEmpty ? 'Connected' : 'Not Connected'}

    Firebase Configuration: ${DefaultFirebaseOptions.currentPlatform}
    ''';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: errorMessage != null
            ? Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              )
            :
            // success like /media/image.png
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Firebase Connected Successfully!',
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    projectInfo,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
