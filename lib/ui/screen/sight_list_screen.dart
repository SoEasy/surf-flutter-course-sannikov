import 'package:flutter/material.dart';
import 'package:places/shared/places_texts.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListWidgetState createState() => _SightListWidgetState();
}

class _SightListWidgetState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      appBar: AppBar(
        title: Text(PlacesTexts.AppTitle)
      ),
    );
  }
}
