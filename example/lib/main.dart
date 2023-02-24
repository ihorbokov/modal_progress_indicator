import 'package:flutter/material.dart';
import 'package:modal_progress_indicator/modal_progress_indicator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Modal Progress Indicator Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _inProgress = false;

  Future<void> _showProgress() async {
    setState(() => _inProgress = true);
    await Future<void>.delayed(const Duration(seconds: 5));
    if (_inProgress) setState(() => _inProgress = false);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressIndicator(
      visible: _inProgress,
      dismissible: true,
      onDismiss: () => setState(
        () => _inProgress = false,
      ),
      indicator: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 4,
        ),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      alignment: Alignment.topCenter,
      options: const BackgroundOptions(
        color: Colors.black,
        opacity: 0.5,
        blurEffect: BlurEffect(
          sigmaX: 1.5,
          sigmaY: 1.5,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            for (var i = 0; i < 10; i++)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing "
                  "and typesetting industry. Lorem Ipsum has been the "
                  "industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and "
                  "scrambled it to make a type specimen book. "
                  "It has survived not only five centuries, but also "
                  "the leap into electronic typesetting, remaining "
                  "essentially unchanged. It was popularised in the 1960s "
                  "with the release of Letraset sheets containing Lorem "
                  "Ipsum passages, and more recently with desktop "
                  "publishing software like Aldus PageMaker including "
                  "versions of Lorem Ipsum.",
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showProgress,
          child: const Icon(Icons.upload),
        ),
      ),
    );
  }
}
