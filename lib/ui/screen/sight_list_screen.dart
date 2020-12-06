import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
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
        // Не знаю надо ли было делать отступы как в макете, сделал
        title: Padding(
          padding: EdgeInsets.only(top: 40, bottom: 16),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: PlacesColors.White_Main,
                fontSize: 32,
                height: 1.125, // line-height 36
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: 'Список\n',
                  style: TextStyle(
                    color: Colors.green
                  )
                ),
                TextSpan(
                  text: 'интересных мест',
                  style: TextStyle(
                    color: Colors.yellow
                  )
                )
              ]
            )
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 128,
      )
    );
  }
}
