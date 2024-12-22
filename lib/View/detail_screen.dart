import 'dart:core';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;

  DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap the entire body in SingleChildScrollView
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align to top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the CircleAvatar image on top
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
              SizedBox(height: 20), // Add space below the image

              // Display the country stats in a scrollable card
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    ReusableRow(title: 'Cases', value: widget.totalCases.toString()),
                    ReusableRow(title: 'Recovered', value: widget.totalRecovered.toString()),
                    ReusableRow(title: 'Death', value: widget.totalDeaths.toString()),
                    ReusableRow(title: 'Critical', value: widget.critical.toString()),
                    ReusableRow(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                  ],
                ),
              ),
              SizedBox(height: 20), // Add space below the card
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
