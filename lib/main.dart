import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea2: Text to Speech',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Pasar texto a audio (Text to Speech)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VoiceController _voiceController;

  String text = 'Ejercicio de escribir algo y que te lo pase por voz';

  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _voiceController.stop();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(text);
    });
  }

  _stopVoice() {
    _voiceController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: _playVoice,
              color: Colors.purple[100],
              child: Text('Escuchar audio'),
            ),
            RaisedButton(
              onPressed: _stopVoice,
              color: Colors.purple[200],
              child: Text('Parar audio'),
            ),
          ],
        ),
      ),
    );
  }
}
