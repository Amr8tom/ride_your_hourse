import 'package:flutter/material.dart';
import 'package:hourse/screens/privacy_policy_screen.dart';
import 'package:hourse/screens/ride_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../utils/constants/contants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showRidingScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RidingScreen(image: _image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Ride your ${Contants.animalName}!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Positioned(
            top: 10,
            left: 30,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(),
                  ),
                );
              },
              child: Text(
                "PrivacyPolicy",
                style: TextStyle(color: Colors.blueGrey),
              ),
            )),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // GIF image of the ${Contants.
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/images/${Contants.animalName}.gif', // Replace with your GIF file
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // Upload photo button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15), // Optional: adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Optional: adjust border radius
                    ),
                  ),
                  onPressed: _pickImage,
                  child: const Text(
                    'Upload Your Photo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Display the uploaded image if any
                _image != null
                    ? Image.file(
                        _image!,
                        width: 150,
                        height: 150,
                      )
                    : Text(
                        'Upload a photo and watch \n yourself ride the ${Contants.animalName}!',
                        style: TextStyle(color: Colors.blue),
                      ),
                const SizedBox(height: 20),
                // Button to see themselves riding the animal
                ElevatedButton(
                  onPressed: _showRidingScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15), // Optional: adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Optional: adjust border radius
                    ),
                  ),
                  child: Text(
                    'Ride the ${Contants.animalName}!',
                    style: TextStyle(
                      color: Colors
                          .white, // Text color (can be omitted if using `onPrimary`)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
