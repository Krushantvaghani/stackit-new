import 'package:flutter/material.dart';

class TravelDetails extends StatefulWidget {
  const TravelDetails({Key? key}) : super(key: key);

  @override
  _TravelDetailsState createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Details"),
      ),
      body: Container(),
    );
  }
}
