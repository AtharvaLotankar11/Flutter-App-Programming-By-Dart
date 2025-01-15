import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Updated to use Audioplayers

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // Constructor with super.key
  XylophoneApp({super.key});

  // Instantiate the AudioPlayer to use for playing sounds
  final AudioPlayer player = AudioPlayer();

  // Method to play the sound
  void playSound(int soundNumber) async {
    try {
      await player.play(AssetSource('assets/note$soundNumber.wav')); // Simply await the play method
    } catch (e) {
      // Optionally, handle the error in a different way (e.g., show a Snackbar, or UI update)
      // Since you don't want to print errors, we leave it empty or use another approach
    }
  }

  // Builds a button that will play the corresponding sound
  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color), // Updated to use TextButton
        onPressed: () {
          playSound(soundNumber);
        },
        child: Container(), // To keep the button visible
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.teal, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
