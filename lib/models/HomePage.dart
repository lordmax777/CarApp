import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 125,
            backgroundColor: Colors.cyan,
            title: Text("Mashina Listi"),
          ),
          body: Column(
            children: [
              Container(
                child: Text("Ijaraga Mashina"),
              ),
            ],
          ),
        ),
    );
  }
}
