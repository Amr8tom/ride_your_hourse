import 'package:flutter/material.dart';
import 'dart:io';
import 'package:lottie/lottie.dart';

import '../utils/constants/contants.dart';

class RidingScreen extends StatelessWidget {
  final File? image;
  const RidingScreen({Key? key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ride the ${Contants.animalName}!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Stack(
          children: [
            Lottie.asset("assets/images/rain.json"),
            // GIF image of the dragon
            Padding(
              padding: EdgeInsets.only(top: 115),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  'assets/images/${Contants.animalName}.gif', // Replace with your GIF file
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Display the uploaded image if any
            if (image != null)
              Positioned(
                top: 10, // Adjust as needed
                left: 40, // Adjust as needed
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
