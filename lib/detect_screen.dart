import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera_auto_zoom/bndbox.dart';
import 'package:camera_auto_zoom/camera.dart';
import 'dart:math' as math;

class DetectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const DetectScreen({super.key, required this.cameras});

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            setRecognitions,
          ),
          BndBox(
              _recognitions ?? [],
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              ),
        ],
      ),
    );
  }
}
