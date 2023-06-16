import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}
  //devDiariesWithVee on Instagram
 //devDiariesWithVee on Youtube
 //vaidehi2701 on Github/Linkedin

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'TypeWriter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // The index of the current string
  int _currentIndex = 0;

  // The index of the current character
  int _currentCharIndex = 0;

  // The list of strings to display
  final List<String> _strings = [
    "Welcome to DevDiariesWithVee",
    "For flutter tutorial",
    "And more...",
  ];

// The animation function
// It will be called when the user clicks on the play button
  void _typingAnimation() {
    setState(() {
      if (_currentCharIndex < _strings[_currentIndex].length) {
        _currentCharIndex++;
      } else {
        _currentIndex = (_currentIndex + 1) % _strings.length;
        _currentCharIndex = 0;
      }
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      _typingAnimation();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _typingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevDiariesWithVee'),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 24.0,
          fontStyle: FontStyle.italic,
          color: Colors.black,
        ),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            height: 200,
            color: Colors.purple[100],
            alignment: Alignment.centerLeft,
            child: AnimatedTextKit(
              // use the TypewriterAnimatedText widget
              animatedTexts: [
                TypewriterAnimatedText('Welcome to DevDiariesWithVee'),
                TypewriterAnimatedText('learn flutter'),
                TypewriterAnimatedText('with fun'),
              ],
              onTap: () {
                debugPrint("Do something");
              },
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: 200,
              color: Colors.pink[100],
              alignment: Alignment.centerLeft,
              child: Align(
                alignment: Alignment.centerLeft,
                // The text to display
                // It will be updated when the user clicks on the play button
                child: Text(
                  _strings[_currentIndex].substring(0, _currentCharIndex),
                  style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
