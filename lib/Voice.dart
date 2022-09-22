import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:flutter_sound/flutter_sound.dart';

class Voice extends StatefulWidget {
  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  final record = Record();

  // Import package
// Check and request permission

  void startRecording() async {
    if (await record.hasPermission()) {
      // Start recording
      await record.start(
        path: 'aFullPath/myFile.m4a',
        encoder: AudioEncoder.aacLc, // by default
        bitRate: 128000, // by default
        samplingRate: 44100, // by default
      );
    }

// Get the state of the recorder
    bool isRecording = await record.isRecording();
  }

// Stop recording
  void stopRecording() async {
    await record.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Icon(Icons.mic, size: 26),
          onPressed: () {
            setState(() {
              startRecording();
              stopRecording();
            });
          },
        ),
      ),
    );
  }
}
